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
