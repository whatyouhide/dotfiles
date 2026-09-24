#!/bin/bash

source "$HOME/dotfiles/lib.sh"

CONFIG="$HOME/.config/herdr/config.toml"
PLUGINS_FILE="$HOME/dotfiles/herdr/plugins.txt"

mkdir -p "$(dirname "$CONFIG")"

ln -sfv "$HOME/dotfiles/herdr/config.toml" "$CONFIG"

if ! type "herdr" >/dev/null 2>&1; then
  warn "herdr is not installed, skipping plugins"
  exit 0
fi

while read -r plugin; do
  [[ -z "$plugin" || "$plugin" == \#* ]] && continue
  herdr plugin install "$plugin" --yes
done <"$PLUGINS_FILE"
