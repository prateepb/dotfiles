# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f /etc/skel/.bashrc ]; then
	. /etc/skel/.bashrc
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
    alias l.='ls -d .* -G'
    alias ll='ls -laF -G'
    alias lll='CLICOLOR_FORCE=true ls -laF -G | less -r'
    alias ls='ls -G'
    alias md5sum='md5'
    alias screenlock='open -a /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app'
fi

echo $DESKTOP_SESSION | grep -q gnome
if [ $? -eq 0 ]
then
    alias screenlock='gnome-screensaver-command --activate'
fi

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias jconsole_socks="jconsole -J-DsocksProxyHost=localhost -J-DsocksProxyPort=1080 127.0.0.1:1234 &"
alias vi='vim'

EDITOR=vim
HISTTIMEFORMAT="%F %T "
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

