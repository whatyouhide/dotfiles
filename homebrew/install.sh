#!/bin/bash

if ! type "brew" >/dev/null 2>&1; then
    echo "Homebrew not found, install it first"
    exit 1
fi

install() {
    brew bundle install --file homebrew/Brewfile --no-lock --cleanup
}

if gum confirm "Do you want to install Homebrew packages?"; then
    install
else
    echo "Skipping Homebrew packages then!"
fi
