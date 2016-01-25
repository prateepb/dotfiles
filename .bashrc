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
if [ -f ~/.bash_aliases ]; then
    . ~/.dotfiles/.bash_aliases
fi

# ----------------------------------------------------------------
# Environment

# OSX Specific
if [[ "$OSTYPE" =~ "darwin" ]]; then
    which -s brew && export BYOBU_PREFIX=$(brew --prefix)
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
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Add timestamp
HISTTIMEFORMAT="%F %T "

# ----------------------------------------------------------------
# Prompt

if [ $UID -eq 0 ]; then
    PS1='\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# ----------------------------------------------------------------
# Misc Functions

function randpw { dd if=/dev/urandom bs=1 count=30 2>/dev/null | base64; }

# OSX Specific
if [[ "$OSTYPE" =~ "darwin" ]]; then
    function hdi_mount_ro { hdiutil attach $1 -readonly; }
    function hdi_mount_rw { hdiutil attach $1; }
fi
