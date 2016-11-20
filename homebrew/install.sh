#!/bin/bash

if [ ! type "$1" >/dev/null 2>&1 ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install git
    brew install hub
    brew install coreutils
    brew install findutils
    brew install readline
    brew install homebrew/dupes/grep
    brew install direnv
    brew install reattach-to-user-namespace
    brew install the_silver_searcher
    brew install ssh-copy-id

    brew doctor
fi
