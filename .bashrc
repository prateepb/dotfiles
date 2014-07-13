# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

echo $OSTYPE | grep -q linux
if [ $? -eq 0 ]
then
    alias l.='ls -d .* --color=auto'
    alias ll='ls -laF --color=auto'
    alias lll='ls -laF --color=always | less -r'
    alias ls='ls --color=auto'
fi

echo $OSTYPE | grep -q darwin
if [ $? -eq 0 ]
then
    PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'

    alias l.='ls -d .* -G'
    alias ll='ls -laF -G'
    alias lll='CLICOLOR_FORCE=true ls -laF -G | less -r'
    alias ls='ls -G'
    alias md5sum='md5'
fi

alias vi='vim'

EDITOR=vim
HISTTIMEFORMAT="%F %T "
PS1="[\u@\h:\W]$ "

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

