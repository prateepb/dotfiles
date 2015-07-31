# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

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

RUBY_BIN=$(find $HOME/.gem/ruby/*/bin -type d 2> /dev/null)
if [ -n "$RUBY_BIN" ]; then
    PATH=$(find $HOME/.gem/ruby/*/bin -type d 2> /dev/null):$PATH
    export PATH
fi

which asciidoctor > /dev/null 2>&1 && alias asciidoc=$( which asciidoctor)

# Start xflux
if [ -n "$DISPLAY" ] && [ -x $HOME/bin/xflux ]
then
    $HOME/bin/xflux -l 53.3 -g -6.3 -k 3400
fi
