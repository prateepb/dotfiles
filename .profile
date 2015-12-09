
umask 0077

# ----------------------------------------------------------------
# Environment

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

# Start xflux
if [ -n "$DISPLAY" ] && [ -x $HOME/bin/xflux ]
then
    $HOME/bin/xflux -l 53.3 -g -6.3 -k 3400
fi
