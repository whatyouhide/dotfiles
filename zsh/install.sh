#!/bin/bash

ROOT="$DOTFILES/zsh"

# Install antigen if it's not already there.
if [[ ! -s "$ROOT/antigen.zsh" ]]; then
  echo 'Installing antigen.zsh...'

  _url='https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh'
  curl -# --output "$ROOT/antigen.zsh" "$_url"
fi

# zshenv
if [[ ! -e "$HOME/.zshenv" ]]; then
  cp -v "$ROOT/zshenv.example" "$HOME/.zshenv"
fi
