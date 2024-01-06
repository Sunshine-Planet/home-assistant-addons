

# #this file witll be whatever shell user has, but we invoke bashio shell for config
bashio /configure.sh

function dvd() {
    echo "will write movie to: $MP4_PATH"
    TITLE=`HandBrakeCLI -I -i /dev/sr0 -o /dev/null/garabe.mp4 2>&1 | grep 'DVD Title:' | head -1 | rev| xargs | cut -f1 -d":" | rev | tr "_" " "`
    HandBrakeCLI --main-feature -i /dev/sr0 -o "$MP4_PATH/${TITLE}.mp4" -q 20 -B 160 -s none
    echo "wrote movie to: $MP4_PATH/${TITLE}.mp4"
}


function mp3() {
    abcde -o mp3:-V2 -x -p
}

function series () 
{ 
    SHOWS_PATH=${SERIES_PATH:-"/media/shows"}
    echo "Usages: series SEASON DISC_FIRST_EPISODE MIN_RUN_MINUTES"
    SEASON=${1:-1}
    DISC_FIRST_EPISODE=${2:-1}
    MYID=$BASHPID #avoid subshell issues
    minutes=${3:-21} #default: 30 minute shows with ads
    min_dur=$(($minutes * 60))
    echo "will write titles >${minutes}m to: $SHOWS_PATH";
    echo "Gettting disc info..."
    HandBrakeCLI -i /dev/sr0 --title=0 --min-duration $min_dur > /tmp/stdout_$MYID.txt 2>/tmp/stderr_$MYID.txt
    TITLE=`cat /tmp/stdout_$MYID.txt | grep 'DVD Title:' | head -1 | rev | cut -f1 -d":" | rev | xargs`;
    echo "Using Title Prefix $TITLE"    
    if [ -z "$TITLE" ];then
        echo "Error in script"
    fi
    TITLES=`cat /tmp/stderr_$MYID.txt | grep -e '+ title [0-9]*' | sed 's/+ title \([0-9]*\):/\1/'`
    TITLES=($TITLES)
    echo "Found ${#TITLES[@]} titles over $minutes minutes (you can change this by passing minues to command)"
    mkdir "$SHOWS_PATH/${TITLE%_*}"
    for index in ${TITLES[@]};do
        TARG="$SHOWS_PATH/${TITLE%_*}/${TITLE%_*} S${SEASON}E$((${DISC_FIRST_EPISODE}-1+${index})).mp4"

        echo "writing title ${index} to  $TARG ...."
        if [ -f "$TARG" ];then
            echo "file exists, skip"
            continue
        fi
        echo "please wait.."
        HandBrakeCLI --title ${index} -i /dev/sr0 -o "$TARG"  -q 20 -B 160 -s none 2>/tmp/encode_$MYID.txt >&2;
        echo -e "\tdone"  
    done
    #
    #echo "wrote movie to: $MP4_PATH/${TITLE}.mp4"
}

alias mp4='dvd'
alias season='series'
