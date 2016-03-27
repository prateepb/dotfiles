
# Color-echo
# arg $1 = message
# arg $2 = Color
# arg $3 = -n
cecho() {
    # Resets the style
    reset=`tput sgr0`

    echo $3 -e "${2}${1}${reset}"
    return
}

exit_status () {
    local e=$?;
    [ $e != 0 ] && echo "$e "
}

meetingplanner () {
    if [[ "$OSTYPE" =~ "darwin" ]]; then
        DATE_COMMAND="gdate"
    else
        DATE_COMMAND="date"
    fi

    CITIES='&p1=78&p2=224&p3=179&p4=240'

    if [ -z "$1" ]; then
        DATE=$( $DATE_COMMAND '+%Y%m%d' )
    elif [[ "$1" =~ [0-9]{8} ]]; then
        DATE=$1
    else
        DATE=$( $DATE_COMMAND --date "$1" '+%Y%m%d' )
    fi

    $OPEN_COMMAND "http://www.timeanddate.com/worldclock/meetingtime.html?iso=${DATE}${CITIES}&iv=1800"
}

randpw () { dd if=/dev/urandom bs=1 count=30 2>/dev/null | base64; }
