# CD Reader (Ripper) for Home Assistant

You got a Mediqa Center (i.e. HA w/ Plex)...
You got Media Players...

..got media?

## Install

This add-on is a 3rd party add-on, so install is 2 steps.

1. Add This "Repository" to your HA Instance
[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Feddiewebb%2Fhome-assistant-addons)
1. Install this add from your add-on store (Ctrl+Refresh if you do not see it.)
[![Open your Home Assistant instance and show the Supervisor add-on store.](https://my.home-assistant.io/badges/supervisor_store.svg)](https://my.home-assistant.io/redirect/supervisor_store/)




## Configure

1) Provide paths for mp3 and mp4 files (defaults to `/media/music` and `/media/movies`)

## Using

Open web UI and run the provided `mp3 or dvd` commands.


## Concepts

## CD Rom Access

This was the toughtest part of this darn addon, fighting HA to get right permissions for access to CDROM.

### CD Software

Uses `abcde` to read software.   Connects to multiple CDDB using the `musicbrainz` app and fallback `cbbd` which is less robust but more titles.

`abcde -o mp3:-V2 -x -p  [tracks]`


### Terminal

Heavy use of [addon-ssh](https://github.com/hassio-addons/addon-ssh) components to expose an interactive terminal via [ttyd](https://github.com/tsl0922/ttyd.git)