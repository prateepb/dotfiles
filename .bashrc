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

if [[ -d "/usr/local/opt/coreutils/libexec" ]]; then
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi

if [[ -d "/usr/local/m-cli" ]]; then
    export PATH="$PATH:/usr/local/m-cli"
fi

# Linux Specific
if [[ "$OSTYPE" =~ "linux" ]]; then
    OPEN_COMMAND="xdg-open"
fi

export EDITOR=vim

# Colors
NO_COLOUR='\e[00m'
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

BOLD_BLACK='\033[1;30m'
BOLD_RED='\033[1;31m'
BOLD_GREEN='\033[1;32m'
BOLD_YELLOW='\033[1;33m'
BOLD_BLUE='\033[1;34m'
BOLD_MAGENTA='\033[1;35m'
BOLD_CYAN='\033[1;36m'
BOLD_WHITE='\033[1;37m'

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;196m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
export LESS_ZZZZZZZZZZ=$'\E[0m'           # end mode

export PACKER_CACHE_DIR="${HOME}/var/packer_cache"

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
HISTIGNORE="exit:rm *"

# ----------------------------------------------------------------
# Prompt

if [ $UID -eq 0 ]; then
    PS1="\[${BOLD_RED}\]\$(exit_status)\u@\h\[${NO_COLOUR}\]:\[${BOLD_BLUE}\]\w\[${NO_COLOUR}\]\$ "
else
    PS1="\[${BOLD_RED}\]\$(exit_status)\[${BOLD_GREEN}\]\u@\h\[${NO_COLOUR}\]:\[${BOLD_BLUE}\]\w\[${NO_COLOUR}\]\$ "
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h:\w\a\]$PS1"
    ;;
*)
    ;;
esac

[[ "$OSTYPE" =~ "darwin" ]] && PROMPT_COMMAND="check_secure_mounts"

# ----------------------------------------------------------------
# Misc Functions

. ~/.dotfiles/.bash_functions

if [[ "$OSTYPE" =~ "darwin" ]]; then
    . ~/.dotfiles/.bash_functions_osx
fi
