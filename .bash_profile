# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

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
[[ -d "$HOME/.rvm/bin" ]] && export PATH="$PATH:$HOME/.rvm/bin"      # Add RVM to PATH for scripting


# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;196m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
export LESS_ZZZZZZZZZZ=$'\E[0m'           # end mode

export EDITOR=vim
export PACKER_CACHE_DIR="${HOME}/tmp/packer_cache"


# ----------------------------------------------------------------
# Startup

# Start xflux
if [ -n "$DISPLAY" ] && [ -x $HOME/bin/xflux ]
then
    $HOME/bin/xflux -l 53.3 -g -6.3 -k 3400
fi
