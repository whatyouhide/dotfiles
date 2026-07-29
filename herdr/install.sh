#!/bin/bash

CONFIG="$HOME/.config/herdr/config.toml"

mkdir -p "$(dirname "$CONFIG")"

ln -sfv "$HOME/dotfiles/herdr/config.toml" "$CONFIG"
