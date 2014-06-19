# OSX (and some Linux) dotfiles

These dotfiles contain crafted configurations for the tools I use.  
I mainly develop on OSX <strike>but most of this stuff should work on Linux
too</strike> fuck it, I don't have the time to support an OS I rearely work with
and which I don't see myself using in the future. I doubt this will be a problem
for anyone anyway :).


## Install

To install these dotfiles, feed this to a shell:

    curl -sL https://raw.github.com/whatyouhide/dotfiles/go/install | sh

You will be prompted with the admin password in order to install Pygments and
(maybe) oh-my-zsh.


## New machine setup

Symlinks are stored inside `links.yml`. This file contains the files in this repo
that will be linked to `~`. Have a look at it before proceeding.

Rake tasks are the main interface for setting up a new machine. List them with
`rake -T` or just issue:

    rake new_machine


Once this is done, go with (*in this order, cowboy*):

```
$ brew bundle ./setup/Brewfile
$ ./setup/osx
$ ./setup/gems-and-npms
$ ./setup/keyremap4macbook-remap.sh
```
