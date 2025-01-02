#!/bin/bash

CONFIG="$HOME/.config/ghostty/config"

mkdir -p "$(dirname "$CONFIG")"

ln -sfv "$HOME/dotfiles/ghostty/config.conf" "$HOME/.config/ghostty/config"
