#!/bin/bash

LN_FILES=(
    .bash_profile
    .bash_sessions_disable
    .bashrc
    .npmrc
    .profile
    .s3cfg
    .vimrc
)

echo "[*] symlinking files..."

for FILE in ${LN_FILES[@]}
do
    ln -sfv ${HOME}/.dotfiles/${FILE} ${HOME}/${FILE}
done

[[ -d $HOME/.vagrant.d ]] && ln -sfv $HOME/.dotfiles/vagrant.d/Vagrantfile $HOME/.vagrant.d/Vagrantfile
exit 0
