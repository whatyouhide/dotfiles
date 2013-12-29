#!/bin/bash

# Make sure we’re using the latest Homebrew
echo 'Updating brew...'
brew update

# Upgrade any already-installed formulae
echo 'Upgrading existing formulae...'
brew upgrade


# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep
brew tap josegonzalez/homebrew-php

# Install everything else
brew install ack
brew install git
brew install rename
brew install tree
brew install imagesnap

# Install wget with IRI support
brew install wget --enable-iri

# Install Cask (OS X app installer - brew-like)
brew tap phinze/homebrew-cask
brew install brew-cask


# Remove outdated versions from the cellar
'Running brew cleanup...'
brew cleanup -s

echo 'Running brew doctor...'
brew doctor


# Install cask applications
~/.dotfiles/setup/helpers/cask-apps.sh
