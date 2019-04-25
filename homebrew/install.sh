#!/bin/bash

if [ ! type "$1" >/dev/null 2>&1 ]; then
    echo "Homebrew not found, install it first"
fi

brew install git
brew install hub
brew install coreutils
brew install findutils
brew install readline
brew install homebrew/dupes/grep
brew install ssh-copy-id
brew install antigen
