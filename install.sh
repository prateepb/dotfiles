#!/bin/bash

ln -sfv $HOME/.dotfiles/.bash_profile $HOME/.bash_profile
ln -sfv $HOME/.dotfiles/.bashrc $HOME/.bashrc
ln -sfv $HOME/.dotfiles/.vimrc $HOME/.vimrc
[[ -d $HOME/.vagrant.d ]] && ln -sfv $HOME/.dotfiles/vagrant.d/Vagrantfile $HOME/.vagrant.d/Vagrantfile
exit 0
