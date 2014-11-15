#!/bin/bash

ROOT="$DOTFILES/vim"

# Link the main vim directory (after removing the symlink in ~).
rm -f "$HOME/.vim" && ln -sv "$ROOT" "$HOME/.vim"

# vim-plug
_autoload="$ROOT/autoload"
mkdir -p "$_autoload"

if [[ ! -s "$_autoload/plug.vim" ]]; then
  echo "Installing vim-plug..."

  _url="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  curl --fail --progress-bar --output "$_autoload/plug.vim" "$_url"
fi
