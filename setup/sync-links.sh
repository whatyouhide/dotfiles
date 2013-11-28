#!/bin/bash

# Links all the specified dotfiles inside ~.
# extra/ is for the files you think are useless
# for other people (should they fork/clone your repo), like
# configuration files for tools only you use and stuff like that.
# You can keep it empty if you want.


# NOTE: if the cmdline argument "--after-cleaning" is passed
# to this script, it will remove all the previously linked dotfiles
# before re-linking them.


declare -a dotfiles=(
    bash_profile
    bashrc
    inputrc
    vim
    vimrc
    tm_properties
    git/.gitconfig
    irbrc
    extra/*
)

for dotfile in "${dotfiles[@]}"; do

    orig_df=$HOME/.dotfiles/$dotfile
    home_df="null"
    
    echo $orig_df
    

    # Add a dot before the name of the file if it hasn't one already
    if [[ `basename "$orig_df"` == .* ]]; then
        home_df="$HOME/`basename $dotfile`"
    else
        home_df="$HOME/.`basename $dotfile`"
    fi
    
    # Clean 
    if [[ $1 == "--after-cleaning" ]]; then
        rm -r "$home_df" && echo -e "\033[1;34mRemoved\033[0m $home_df"
    fi

    # Link  
    if [ -h "$home_df" ]; then
        echo -e "$home_df \033[1;31malready exists\033[0m (couldn't link $orig_df)"
    else
        ln -s "$orig_df" "$home_df"
        echo -e "\033[1;32mLinked\033[0m $orig_df to $home_df"
    fi
done
