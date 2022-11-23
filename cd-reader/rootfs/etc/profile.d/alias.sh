#!/usr/bin/env bashio

function dvd() {
    TITLE=`HandBrakeCLI -I -i /dev/sr0 -o /dev/null/garabe.mp4 2>&1 | grep 'DVD Title:' | head -1 | rev | cut -f1 -d" " | rev | tr "_" " "`
    HandBrakeCLI --main-feature -i /dev/sr0 -o "$(bashio::config 'mp4_path')/${TITLE}.mp4" -q 20 -B 160 -s none
    echo "Wrote movie to: $(bashio::config 'mp4_path')/${TITLE}.mp4"
}


function cd() {
    abcde -o mp3:-V2 -x -p -o "$(bashio::config 'mp3_path')"
}

alias movie='dvd'
alias mp3='cd'
