
chmod 700 $HOME
if [[ $EUID -eq 0 ]]; then
    umask 0077
else
    umask 0022
fi

# ----------------------------------------------------------------
# Environment

if [ -h /system/bin/bootkali ]
then
    PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/system/xbin
fi

PATH=$HOME/bin:$PATH

if [ -d $HOME/opt ]
then
    for DIR in $( ls $HOME/opt )
    do
        if [ -d ${HOME}/opt/${DIR} ]
        then
            PATH=${HOME}/opt/${DIR}:$PATH
        fi

        if [ -d ${HOME}/opt/${DIR}/bin ]
        then
            PATH=${HOME}/opt/${DIR}/bin:$PATH
        fi
    done
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# ----------------------------------------------------------------
# Startup

mesg n

# Start xflux
if [ -n "$DISPLAY" ] && [ -x $HOME/bin/xflux ]
then
    $HOME/bin/xflux -l 53.3 -g -6.3 -k 3400
fi

# Display fortunes
if ( which -s fortune ) && [ -d $HOME/usr/share/games/fortunes ]
then
    $HOME/usr/share/games/fortunes/motd.sh
    cat $HOME/etc/motd
elif ( which -s fortune )
then
    echo ""
    fortune
    echo ""
fi
