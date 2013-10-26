#!/bin/bash

# classic dotfiles
for link in $HOME/.dotfiles/.{bash_profile,bashrc,inputrc,vim,vimrc,remediarc}; do
	ln -sv $link $HOME
done

# stuff hidden inside folders
ln -sv $HOME/.dotfiles/git/.gitconfig $HOME
