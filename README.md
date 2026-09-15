# Rice Group Inc. — Wayback restoration

This repository is a static restoration of public captures from the Internet Archive.
It stores the newest successful capture for each unique 
ricegroupinc.com URL in
site/ and the CDX capture index in .wayback/.

## Refreshing the archive

Run pwsh ./scripts/restore-wayback.ps1. The restore is resumable; already-downloaded
files are retained. Captures are replayed directly from the Wayback Machine, and this
repository does not claim ownership of their underlying content.
