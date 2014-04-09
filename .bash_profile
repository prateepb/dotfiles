# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

if [ -d $HOME/opt ]
then
    for DIR in $( ls $HOME/opt )
    do
        if [ -d ${HOME}/opt/${DIR} ]
        then
            PATH=$PATH:${HOME}/opt/${DIR}
        fi

        if [ -d ${HOME}/opt/${DIR}/bin ]
        then
            PATH=$PATH:${HOME}/opt/${DIR}/bin
        fi
    done
fi

PATH=$PATH:$(find $HOME/.gem/ruby/*/bin -type d)
export PATH

# Start xflux
if [ -n "$DISPLAY" ] && [ -x $HOME/bin/xflux ]
then
    $HOME/bin/xflux -l 53.3 -g -6.3 -k 3400
fi
