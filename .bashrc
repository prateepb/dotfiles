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
    alias l.='ls -d .* -G'
    alias ll='ls -laF -G'
    alias ls='ls -G'
fi


alias vi='vim'

