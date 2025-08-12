#!/bin/bash

CONFIG="$HOME/.config/btop/btop.conf"

mkdir -p "$(dirname "$CONFIG")"

ln -sfv "$HOME/dotfiles/btop/btop.conf" "$CONFIG"
