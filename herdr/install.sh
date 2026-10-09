#!/bin/bash

set -e

source "$HOME/dotfiles/lib.sh"

CONFIG="$HOME/.config/herdr/config.toml"
PLUGINS_FILE="$HOME/dotfiles/herdr/plugins.txt"

mkdir -p "$(dirname "$CONFIG")"
chmod go-w "$(dirname "$CONFIG")"

# Herdr requires a regular file. Run this script after you edit the repo config.
CONFIG_TMP="$(mktemp "${CONFIG}.XXXXXX")"
trap 'rm -f "$CONFIG_TMP"' EXIT
install -m 600 "$HOME/dotfiles/herdr/config.toml" "$CONFIG_TMP"
mv -f "$CONFIG_TMP" "$CONFIG"

if ! type "herdr" >/dev/null 2>&1; then
  warn "herdr is not installed, skipping plugins"
  exit 0
fi

while read -r plugin; do
  [[ -z "$plugin" || "$plugin" == \#* ]] && continue
  herdr plugin install "$plugin" --yes
done <"$PLUGINS_FILE"
