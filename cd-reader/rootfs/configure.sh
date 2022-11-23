#!/usr/bin/env bashio
export MP3_PATH=$(bashio::config 'mp3_path')
export MP4_PATH=$(bashio::config 'mp4_path')
echo "MP3 Folder: $MP3_PATH"
echo "MP4 Folder: $MP4_PATH"

echo "OUTPUTDIR=$MP3_PATH" >> /etc/abcde.conf
