# OSX (and some Linux) dotfiles

These dotfiles contain crafted configurations for the tools I use.  
Most of these dotfiles are OSX specific. With some manual tweaking, they should
work on Linux too (manually clone, install zsh, vim etc.).


## Install

To install these dotfiles, feed this to a shell:

    curl -sL https://raw.github.com/whatyouhide/dotfiles/go/install | sh


## New machine setup

Symlinks are stored inside `links.yml`. This file contains the files in this repo
that will be linked to `~`. Have a look at it before proceeding, comments should
explain how things work.

Rake tasks are the main interface for setting up a new machine. List them with
`rake -T` or just issue:

    rake new_machine

Once this is done, go with (*in this order, cowboy*):

```
$ brew bundle ./setup/Brewfile
$ ./setup/osx
$ ./setup/gem-npm-pip
$ ./setup/keyremap4macbook-remap.sh
```

This order ensures that `brew` installs all the fundamental stuff (tools and GUI
apps which will be tweaked in `setup/osx`) as well as Python and NodeJS (which
will be needed in order to install stuff in `setup/gem-npm-pip`).

`setup/keyremap4macbook-remap.sh` sets the OSX keyboard in order to use
`CAPSLOCK` as `Esc` if pressed with no other key, otherwise as `Ctrl`.
