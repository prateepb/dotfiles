# .bash_aliases

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

