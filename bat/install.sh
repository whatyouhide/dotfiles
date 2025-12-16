#!/bin/bash

CONFIG="$HOME/.config/bat/config"

mkdir -p "$(dirname "$CONFIG")"

ln -sfv "$HOME/dotfiles/bat/config" "$CONFIG"
