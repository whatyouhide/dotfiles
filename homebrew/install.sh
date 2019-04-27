#!/bin/bash

if [ ! type "$1" >/dev/null 2>&1 ]; then
    echo "Homebrew not found, install it first"
    exit 1
fi

brew install git
brew install hub
brew install coreutils
brew install findutils
brew install readline
brew install ssh-copy-id

# For zsh
brew install antigen

# Version manager (Elixir, Erlang)
brew install asdf
