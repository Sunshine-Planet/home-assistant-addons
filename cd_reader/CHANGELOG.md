# Changelog

## 0.2.0

Adds support for Seasons / Series DVDs.

Run `series <SERIES NAME> [SEASON] [START EPISODE] [Min. Minutes]` 

i.e.  `series Community 2 13` for Disk 2 of Season 2

Writes as /media/shows/SERIES NAME/SERIES NAME - SXXEXX.mp4 which is preferred by Plex for media lookup.


## 0.1.0

Initial release exposes a Terminal to drive common 'nix utilities for backing up CDs or backing up DVDs.

### Added
- exposes `cd` command to run `abcde` 
- exposes `dvd` command to run `HandBrakeCLI`
- exposes web terminal & SSH to interact