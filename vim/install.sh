#!/bin/bash

set -e

ROOT="$DOTFILES/vim"

# Backup the ~/.vim directory and link the new one.
mv "$HOME/.vim" "$HOME/.vim-whatyouhide-bkp"
ln -sv "$ROOT" "$HOME/.vim"

if [[ ! -e "$HOME/.colors.vim" ]]; then
  cp -v "$ROOT/colors.vim.example" "$HOME/.colors.vim"
fi

# Temporary plugins.
touch "$ROOT/tmp-plugins.vim"

# vim-plug
_autoload="$ROOT/autoload"
mkdir -p "$_autoload"

if [[ ! -s "$_autoload/plug.vim" ]]; then
  echo "Installing vim-plug..."
  _url="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  curl --fail --silent "$_url" > "$_autoload/plug.vim"
fi
