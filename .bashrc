# .bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f /etc/skel/.bashrc ]; then
    . /etc/skel/.bashrc
fi

# Add bash aliases.
if [ -f ~/.dotfiles/.bash_aliases ]; then
    . ~/.dotfiles/.bash_aliases
fi

if [[ "$OSTYPE" =~ "darwin" && -f ~/.dotfiles/.bash_aliases_osx ]]; then
    . ~/.dotfiles/.bash_aliases_osx
fi

if [[ "$OSTYPE" =~ "linux" && -f ~/.dotfiles/.bash_aliases_linux ]]; then
    . ~/.dotfiles/.bash_aliases_linux
fi

# ----------------------------------------------------------------
# Environment

# OSX Specific
if [[ "$OSTYPE" =~ "darwin" ]]; then
    OPEN_COMMAND="open"
    which -s brew && export BYOBU_PREFIX=$(brew --prefix)
fi

# Linux Specific
if [[ "$OSTYPE" =~ "linux" ]]; then
    OPEN_COMMAND="xdg-open"
fi

export EDITOR=vim

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;196m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
export LESS_ZZZZZZZZZZ=$'\E[0m'           # end mode

export PACKER_CACHE_DIR="${HOME}/tmp/packer_cache"

# ----------------------------------------------------------------
# History

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL="ignoreboth:erasedups"

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Add timestamp
HISTTIMEFORMAT="%F %T "

# Ignore the following commands
HISTIGNORE="exit:rm *:* *mp4"

# ----------------------------------------------------------------
# Prompt

GREEN="\[\e[01;32m\]"
RED="\[\e[01;31m\]"
BLUE="\[\e[01;34m\]"
NO_COLOUR="\[\e[00m\]"

if [ $UID -eq 0 ]; then
    PS1="${RED}\u@\h${NO_COLOUR}:${BLUE}\w${NO_COLOUR}\$ "
else
    PS1="${GREEN}\u@\h${NO_COLOUR}:${BLUE}\w${NO_COLOUR}\$ "
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h:\w\a\]$PS1"
    ;;
*)
    ;;
esac

PROMPT_COMMAND="prompt_status"

# ----------------------------------------------------------------
# Misc Functions

unset -f update_terminal_cwd

prompt_status () 
{ 
    local e=$?;
    [ $e != 0 ] && echo -n -e "\033[01;31m${e} "
}

function randpw { dd if=/dev/urandom bs=1 count=30 2>/dev/null | base64; }

# OSX Specific
if [[ "$OSTYPE" =~ "darwin" ]]; then
    function hdi_mount_ro { hdiutil attach $1 -readonly; }
    function hdi_mount_rw { hdiutil attach $1; }
fi

function meetingplanner {
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
