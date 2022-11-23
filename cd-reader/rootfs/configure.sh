#!/usr/bin/env bashio
echo "export MP3_PATH=$(bashio::config 'mp3_path')" >> /etc/profile.d/config.sh
echo "export MP4_PATH=$(bashio::config 'mp4_path')"  >> /etc/profile.d/config.sh
chmod a+x /etc/profile.d/config.sh

echo "OUTPUTDIR=$MP3_PATH" >> /etc/abcde.conf
