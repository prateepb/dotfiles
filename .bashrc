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
    alias ls='ls --color=auto'
fi

echo $OSTYPE | grep -q darwin
if [ $? -eq 0 ]
then
    PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'

    alias l.='ls -d .* -G'
    alias ll='ls -laF -G'
    alias ls='ls -G'
fi

EDITOR=vim
HISTTIMEFORMAT="%F %T "
PS1="[\u@\h:\W]$ "

alias vi='vim'

