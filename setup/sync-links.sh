#!/bin/bash

dotfiles=(bash_profile bashrc extra inputrc vim vimrc remediarc tm_properties)

for dotfile in "${dotfiles[@]}"; do
    if [ -h "$HOME/.$dotfile" ]; then
        echo -e "\033[1;31m$HOME/.$dotfile\033[0m already exists."
    else
        ln -sv "$HOME/.dotfiles/${dotfile}" "$HOME/.$dotfile"
    fi
done

# stuff hidden inside folders
ln -sv $HOME/.dotfiles/git/.gitconfig $HOME
