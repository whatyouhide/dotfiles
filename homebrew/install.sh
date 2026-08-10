#!/bin/bash

SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit ; pwd -P )"

source "$SCRIPT_DIR/../lib.sh"

if ! type "brew" >/dev/null 2>&1; then
    echo "Homebrew not found, install it first"
    exit 1
fi

install() {
    brew bundle install --file "$SCRIPT_DIR/Brewfile" --no-lock --cleanup
}

if confirm "Do you want to install Homebrew packages?"; then
    install
else
    echo "Skipping Homebrew packages then!"
fi
