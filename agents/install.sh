#!/bin/bash

set -e

SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
SKILLFILE="$SCRIPT_DIR/Skillfile"

if ! type "npx" >/dev/null 2>&1; then
    echo "npx not found, install Node first"
    exit 1
fi

install() {
    while IFS= read -r line || [ -n "$line" ]; do
        line="${line%%#*}"
        line="$(echo "$line" | xargs)"
        [ -z "$line" ] && continue

        gum style "📚 npx skills add $line" --foreground 33 --bold
        # shellcheck disable=SC2086 # word splitting is intentional
        npx --yes skills add $line --global --agent '*' --yes
        echo
    done < "$SKILLFILE"
}

if gum confirm "Do you want to install agent skills?"; then
    install
else
    echo "Skipping agent skills then!"
fi
