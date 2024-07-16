#!/bin/bash

if ! type "brew" >/dev/null 2>&1; then
    echo "Homebrew not found, install it first"
    exit 1
fi

install() {
    brew bundle install --file homebrew/Brewfile --no-lock --cleanup
}

echo ""
read -r -p "Do you want to install Homebrew packages? (Y/n) " confirmation

case $confirmation in
"")
    install
    ;;
"Y")
    install
    ;;
"n")
    echo "Skipping Homebrew packages then!"
    ;;
esac
