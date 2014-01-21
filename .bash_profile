# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

# Start xflux
if [ -n "$DISPLAY" ] && [ -x $HOME/bin/xflux ]
then
    $HOME/bin/xflux -l 53.3494 -g -6.26008 -k 4100
fi
