# .bash_profile

if [ -f ~/.profile ]; then
    . ~/.profile
fi

if [ -h /system/bin/bootkali ]; then
    . ~/.dotfiles/.bash_profile_nethunter
fi

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
