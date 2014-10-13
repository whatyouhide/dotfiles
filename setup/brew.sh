#!/bin/zsh


# Utility functions and bootstrap =============================================

# Enable colored output.
autoload colors && colors

# Utility functions.
echo_ok()   { echo "$fg[green]$@$reset_color" }
echo_info() { echo "$fg[cyan]$@$reset_color" }
echo_warning() { echo "$fg[yellow]$@$reset_color" }
is-installed() { [[ -n `command brew ls --versions $1` ]] }

# Brew commands.
brew()      { echo -n '=> '; echo_info "brew" $@; command brew $@ }
tap()       { brew tap $1 }
install()   { brew install $@ }
instacask() { brew cask install $@ }


# Updates and taps =============================================================

# Update and upgrade any existing formulae.
brew update -v
brew upgrade

# Taps.
tap homebrew/dupes
tap thoughtbot/formulae
tap phinze/homebrew-cask
tap caskroom/versions


# Formulae ====================================================================

# GNU core utilities (those that come with OS X are outdated)
# GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
install coreutils
install findutils

# More recent versions of some OSX tools
install homebrew/dupes/grep

# Python (install this before vim so that it has Python support, but link after
# because it causes strange problems)
install python python3

# Terminal and shell.
install zsh
install direnv
install tmux
install reattach-to-user-namespace

# Git.
install git
install git-flow
install gith
install hub

# Tools.
install wget --enable-iri
install rsync
install watch
install imagesnap

# Vim.
install macvim --override-system-vim --with-lua --with-luajit

# Dev tools.
install ctags
install the_silver_searcher

# Web dev.
install ngrok
install node
install qt

# Linkings.
brew link python
brew link python3


# Cask ========================================================================

install brew-cask

# Utilities.
instacask spectacle
instacask flux
instacask the-unarchiver
instacask caffeine
instacask appcleaner
instacask karabiner
instacask alfred

# Dev.
instacask iterm2-nightly
instacask google-chrome google-chrome-canary
instacask firefox-aurora
instacask opera

# Misc.
instacask copy
instacask dropbox
instacask google-drive
instacask ynab
instacask vlc
instacask onepassword

# Communication.
instacask telegram
instacask skype

# QuickLook plugins.
instacask qlcolorcode qlstephen qlmarkdown betterzipql


# Cleanup =====================================================================

brew linkapps
brew cleanup -s

brew cask alfred link
brew cask cleanup

brew doctor
