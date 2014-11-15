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
brew()    { echo -n '=> '; echo_info "brew" $@; command brew $@ }
tap()     { brew tap $1 }
install() { brew install $@ }


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
install readline

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
install z

# Git.
install git
install hub
install git-flow
install ghi

# Tools.
install wget --enable-iri
install rsync
install watch
install imagesnap

# Editors.
install macvim --override-system-vim --with-lua --with-luajit
install emacs --HEAD --use-git-head --cocoa --with-gnutls

# Dev tools.
install ctags
install the_silver_searcher

# Web dev.
install ngrok
install node
install imagemagick
install qt

# Databases.
install postgresql
install redis

# Misc.
install todo-txt
install archey
install cloc


# Wrapping up =================================================================

brew link python
brew link python3

brew doctor
