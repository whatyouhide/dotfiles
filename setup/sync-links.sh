#!/bin/bash

dotfiles=(
    bash_profile
    bashrc
    inputrc
    vim
    vimrc
    remediarc
    tm_properties
    git/.gitconfig
    irbrc
)

for dotfile in "${dotfiles[@]}"; do

    orig_df="$HOME/.dotfiles/$dotfile"
    home_df="null"
    

    # Add a dot before the name of the file if it hasn't one already
    if [[ `basename "$orig_df"` == .* ]]; then
        home_df="$HOME/`basename $dotfile`"
    else
        home_df="$HOME/.`basename $dotfile`"
    fi

        
    if [ -h "$home_df" ]; then
        echo -e "$home_df \033[1;31malready exists\033[0m (couldn't link $orig_df)"
    else
        ln -s "$orig_df" "$home_df"
        echo -e "\033[1;32mLinked\033[0m $orig_df to $home_df"
    fi
done
