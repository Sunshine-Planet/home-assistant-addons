

# #this file witll be whatever shell user has, but we invoke bashio shell for config
bashio /configure.sh

function dvd() {
    echo "will write movie to: $MP4_PATH"
    TITLE=`HandBrakeCLI -I -i /dev/sr0 -o /dev/null/garabe.mp4 2>&1 | grep 'DVD Title:' | head -1 | rev | cut -f1 -d":" | rev | tr "_" " "`
    HandBrakeCLI --main-feature -i /dev/sr0 -o "$MP4_PATH/${TITLE}.mp4" -q 20 -B 160 -s none
    echo "wrote movie to: $MP4_PATH/${TITLE}.mp4"
}


function mp3() {
    abcde -o mp3:-V2 -x -p
}


function series () 
{ 
    MYID=$BASHPID #avoid subshell issues
    minutes=${1:-21} #default: 30 minute shows with ads
    min_dur=$(($minutes * 60))
    echo "will write titles >${minutes}m to: $MP4_PATH";
    echo "Gettting disc info..."
    HandBrakeCLI -i /dev/sr0 --title=0 --min-duration $min_dur > /tmp/stdout_$MYID.txt 2>/tmp/stderr_$MYID.txt
    TITLE=`cat /tmp/stdout_$MYID.txt | grep 'DVD Title:' | head -1 | rev | cut -f1 -d":" | rev | tr "_" " "`;
    echo "Using Title Prefix $TITLE"    
    TITLES=` cat /tmp/stderr_$MYID.txt | grep -e '+ title [0-9]*' | sed 's/+ title \([0-9]*\):/\1/'`
    echo "Found $(echo ${TITLES[@]}|wc -l) titles over $minutes minutes (you can change this by passing minues to command)"
    for index in ${TITLES[@]};do
        echo "writing title ${index} to $MP4_PATH/${TITLE}-${index}.mp4  ...."
        HandBrakeCLI --title ${index} -i /dev/sr0 -o "$MP4_PATH/${TITLE}-${index}.mp4"  -q 20 -B 160 -s none 2>/tmp/encode_$MYID.txt;
        echo -e "\tdone"  
    done
    #
    #echo "wrote movie to: $MP4_PATH/${TITLE}.mp4"
}

alias mp4='dvd'
alias season='series'
