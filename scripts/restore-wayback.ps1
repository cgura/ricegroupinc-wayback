param(
  [int]$MinimumDelaySeconds = 15,
  [int]$MaximumDelaySeconds = 30,
  [switch]$SkipDownload,
  [switch]$RefreshIndex
)

$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
$siteRoot = Join-Path $projectRoot 'site'
$metadataRoot = Join-Path $projectRoot '.wayback'
New-Item -ItemType Directory -Force -Path $siteRoot, $metadataRoot | Out-Null

$cdxUri = 'https://web.archive.org/cdx/search/cdx?url=ricegroupinc.com/*&output=json&fl=timestamp,original,statuscode,mimetype,digest&filter=statuscode:200&collapse=digest'
$indexPath = Join-Path $metadataRoot 'cdx-collapsed-digest.json'
if ($RefreshIndex -or -not (Test-Path -LiteralPath $indexPath)) {
  Invoke-WebRequest -UseBasicParsing -Uri $cdxUri -OutFile $indexPath
}
$rows = Get-Content -Raw $indexPath | ConvertFrom-Json
$headers = $rows[0]
$captures = foreach ($row in $rows[1..($rows.Count - 1)]) {
  [pscustomobject]@{
    timestamp = [string]$row[0]
    original = [string]$row[1]
    statuscode = [string]$row[2]
    mimetype = [string]$row[3]
    digest = [string]$row[4]
  }
}

# A URL may appear many times because its response changed.  The newest capture is
# the useful static-site version; the full digest-level CDX index remains above.
$latest = $captures |
  Group-Object original |
  ForEach-Object { $_.Group | Sort-Object timestamp -Descending | Select-Object -First 1 } |
  Where-Object { ([uri]$_.original).AbsolutePath -notmatch '(?i)^/listingproperties(?:/|$)' } |
  Sort-Object original
$latest | ConvertTo-Json -Depth 3 | Set-Content -Encoding utf8 (Join-Path $metadataRoot 'latest-captures.json')
$latest | Select-Object timestamp, original, mimetype, digest | Export-Csv -NoTypeInformation -Encoding utf8 (Join-Path $metadataRoot 'latest-captures.csv')

function Get-LocalPath([object]$capture) {
  $uri = [uri]$capture.original
  $path = [uri]::UnescapeDataString($uri.AbsolutePath)
  if ([string]::IsNullOrWhiteSpace($path) -or $path -eq '/') { return 'index.html' }
  $clean = ($path.TrimStart('/') -replace '[<>:"|?*]', '_')
  if ($capture.mimetype -match '^text/html') {
    if ($clean.EndsWith('/')) { return (Join-Path $clean 'index.html') }
    if ([IO.Path]::GetExtension($clean)) { return $clean }
    return (Join-Path $clean 'index.html')
  }
  return $clean
}

$jobs = foreach ($capture in $latest) {
  $relativePath = Get-LocalPath $capture
  $destination = Join-Path $siteRoot $relativePath
  [pscustomobject]@{ timestamp = $capture.timestamp; original = $capture.original; destination = $destination }
}

if (-not $SkipDownload) {
  if ($MinimumDelaySeconds -lt 1 -or $MaximumDelaySeconds -lt $MinimumDelaySeconds) {
    throw 'The request delay must be at least one second and have a valid range.'
  }
  $random = [System.Random]::new()
  $pending = @($jobs | Where-Object { -not (Test-Path -LiteralPath $_.destination) })
  for ($index = 0; $index -lt $pending.Count; $index++) {
    $job = $pending[$index]
    $delayMilliseconds = $random.Next($MinimumDelaySeconds * 1000, ($MaximumDelaySeconds * 1000) + 1)
    Write-Host "[$($index + 1)/$($pending.Count)] Waiting $([math]::Round($delayMilliseconds / 1000, 1)) seconds before $($job.original)"
    Start-Sleep -Milliseconds $delayMilliseconds
    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $job.destination) | Out-Null
    $archiveUrl = "https://web.archive.org/web/$($job.timestamp)id_/$($job.original)"
    for ($attempt = 1; $attempt -le 3; $attempt++) {
      try {
        Invoke-WebRequest -UseBasicParsing -Uri $archiveUrl -OutFile $job.destination -TimeoutSec 90 -Headers @{ 'User-Agent' = 'ricegroupinc-wayback-restoration/1.0 (+https://github.com/cgura/ricegroupinc-wayback)' }
        break
      } catch {
        if ($attempt -eq 3) { Write-Warning "Failed: $($job.original) :: $($_.Exception.Message)" }
        Start-Sleep -Seconds (5 * $attempt)
      }
    }
  }
}

# Remove archive URL wrappers and keep same-site links local. This only touches HTML.
Get-ChildItem -Path $siteRoot -Filter '*.html' -Recurse | ForEach-Object {
  $html = Get-Content -LiteralPath $_.FullName -Raw
  $html = $html -replace 'https?://web\.archive\.org/web/\d+(?:[a-z_]+)?/(https?://(?:www\.)?ricegroupinc\.com/)', '$1'
  $html = $html -replace 'https?://(?:www\.)?ricegroupinc\.com/', '/'
  $html = $html -replace '//(?:www\.)?ricegroupinc\.com/', '/'
  $html = $html -replace '<base[^>]*>', ''
  Set-Content -LiteralPath $_.FullName -Value $html -Encoding utf8
}

@'
# Rice Group Inc. — Wayback restoration

This repository is a static restoration of public captures from the Internet Archive.
It stores the newest successful capture for each unique `ricegroupinc.com` URL in
`site/` and the CDX capture index in `.wayback/`.

The `listingproperties` path is intentionally excluded from the static restoration.

## Refreshing the archive

Run `pwsh ./scripts/restore-wayback.ps1`. The restore is resumable; already-downloaded
files are retained. Replay requests run one at a time, with a randomized 15–30 second
delay between requests. Captures are replayed directly from the Wayback Machine, and this
repository does not claim ownership of their underlying content.
'@ | Set-Content -Encoding utf8 (Join-Path $projectRoot 'README.md')

Write-Host "Indexed $($captures.Count) capture variants; restoring $($latest.Count) newest unique URLs."
