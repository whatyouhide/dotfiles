#!/bin/bash

ROOT="$DOTFILES/zsh"

# Install antigen if it's not already there.
if [[ ! -s "$ROOT/antigen.zsh" ]]; then
  echo 'Installing antigen.zsh...'

  _url='https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh'
  curl -# --output "$ROOT/antigen.zsh" "$_url"
fi

# zshenv
if [[ ! -s "$HOME/.env-setup.zsh" ]]; then
  cp -v "$ROOT/env-setup.zsh.example" "$HOME/.env-setup.zsh"
fi

# Remove the default /etc/zprofile if on OSX.
if [[ $(uname) == "Darwin" && -s /etc/zprofile ]]; then
    if [[ $(whoami) == "root" ]]; then
        echo "Removing /etc/zprofile as it only messes things up"
        rm -v /etc/zprofile && echo "Removed /etc/zprofile"
    else
        echo "I wanted to remove /etc/zprofile here on OSX because it's more"
        echo "trouble than anything, but I'm not root so I can't. Run me with"
        echo "sudo :). Btw, the contents of /etc/zprofile are:"
        cat /etc/zprofile
    fi
fi
