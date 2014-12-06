#!/bin/bash

ROOT="$DOTFILES/vim"

# Link the main vim directory (after removing the symlink in ~).
rm -f "$HOME/.vim" && ln -sv "$ROOT" "$HOME/.vim"

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
