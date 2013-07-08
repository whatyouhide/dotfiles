#!/bin/bash

for link in $HOME/.dotfiles/.{bash_profile,bashrc,vim,vimrc,gitconfig}; do
	ln -sv $link $HOME
done