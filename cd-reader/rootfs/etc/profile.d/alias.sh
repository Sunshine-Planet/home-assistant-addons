#!/command/with-contenv bashio
function dvd() {
    TITLE=`HandBrakeCLI -I -i /dev/sr0 -o /dev/null/garabe.mp4 2>&1 | grep 'DVD Title:' | head -1 | rev | cut -f1 -d" " | rev | tr "_" " "`
    HandBrakeCLI --main-feature -i /dev/sr0 -o "/media/movies/${TITLE}.mp4" -q 20 -B 160 -s none
}


function cd() {
    abcde -o mp3:-V2 -x -p
}

alias movie='dvd'
alias mp3='cd'
