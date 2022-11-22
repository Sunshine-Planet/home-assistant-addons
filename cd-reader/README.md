# CD Reader (Ripper) for Home Assistant

You got Plex, you got Assitants, you got media Players - got media?

## Install

FOr now:
1) upload entire folder to /config/addons/
2) Adodn Store > Refreesh (dots in upper right)
3) CD Reader > Install

Really slow cause it builds image. Probably will crash a pi.


## Configure

1) Provide password or key n config
2) Change media path if /media/music is not where you want titles ( `/media/music/album/01.Song Title.mp3`)

## Using

Open web UI and run the provided `abcde` utility.


## Concepts

## CD Rom Access

This was the toughtest part of this darn addon, fighting HA to get right permissions for access to CDROM.

### CD Software

Uses `abcde` to read software.   Connects to multiple CDDB using the `musicbrainz` app and fallback `cbbd` which is less robust but more titles.

`abcde -o mp3:-V2 -x -p  [tracks]`


### Terminal

Heavy use of [addon-ssh](https://github.com/hassio-addons/addon-ssh) components to expose an interactive terminal via [ttyd](https://github.com/tsl0922/ttyd.git)