#!/usr/bin/env bashio

echo -e "MP3 Folder: $(bashio::config 'mp3_path')\n"
echo -e "MP4 Folder: $(bashio::config 'mp4_path')\n"

echo "OUTPUTDIR=$(bashio::config 'mp3_path')" >> /etc/abcde.conf

echo -e '
USAGE: This add-on supports CD and DVD Backups. \n
TO BACKUP CDs: Insert CD and run `cd` to fire `abcde` with default values and writing to MP3 directory.\n
TO BACKUP DVDs: Insert DVD and run `dvd` to fire `HandBrakeCLI` with default values and writing to Movies directory.\n
ADVANCED: You can run either CLI directly with all flags available..\n
'