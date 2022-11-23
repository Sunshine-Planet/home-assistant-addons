
## Configure

1) Provide paths for mp3 and mp4 files (defaults to `/media/music` and `/media/movies`)

## Using

Open 'web UI' (button on add-on info tab) and run the provided `mp3 or dvd` commands.


## Concepts

## CD Rom Access

This was the toughtest part of this darn addon, fighting HA to get right permissions for access to CDROM, hence a slightly lower security score.

### CD Software

Uses `abcde` to read software.   Connects to multiple CDDB using the `musicbrainz` app and fallback `cbbd` which is less robust but more titles.

`abcde -o mp3:-V2 -x -p  [tracks]`

### DVD Software

Uses `Handbrake` and `libdvdcss` to backup encrypted DVD movies to your HA instance.  By default it grabs primary language, no subtitles, feature only.
