# .bash_aliases

# root aliases
if [[ $EUID -eq 0 ]]; then
    alias cp='cp -i'
    alias mv='mv -i'
    alias rm='rm -i'
fi

if [[ "$OSTYPE" =~ "darwin" && -x /usr/local/bin/gls && -x /usr/local/bin/gdircolors ]]; then
    test -r ~/.dotfiles/.dircolors && eval "$(gdircolors -b ~/.dotfiles/.dircolors)" || eval "$(gdircolors -b)"
    alias ll='gls -la --color=auto'
    alias ls='gls --color=auto'
elif [[ -x /usr/bin/dircolors ]]; then
    test -r ~/.dotfiles/.dircolors && eval "$(dircolors -b ~/.dotfiles/.dircolors)" || eval "$(dircolors -b)"
    alias ll='ls -la --color=auto'
    alias ls='ls --color=auto'
elif [[ "$OSTYPE" =~ "darwin" ]]; then
    alias ll='ls -la -G'
    alias ls='ls -G'
fi

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias jconsole_socks="jconsole -J-DsocksProxyHost=localhost -J-DsocksProxyPort=1080 -J-DsocksNonProxyHosts= 127.0.0.1:1234 &"
alias more='less'
alias vagreant='vagrant'
alias vi='vim'

# Get week number
alias week='date +%V'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
