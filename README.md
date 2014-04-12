# OSX (and some Linux) dotfiles

These dotfiles contain crafted configurations for the tools I use.  I mainly
develop on OSX but most of this stuff should work on Linux too.


## Install

To install these dotfiles, feed this to a shell:

    curl -sL https://raw.github.com/whatyouhide/dotfiles/go/install | sh

You will be prompted with the admin password in order to install Pygments and
(maybe) oh-my-zsh.


## Symlink

Symlinks are stored inside `links`. This file contains the files in this repo
that will be linked to `~`. You can use globbing and `#` comments in it.
There are a couple of Rake tasks you can use to symlink configuration files to
`~`. Namely:

* `rake symlink`: standard symlinking
* `rake symlink:clean`: clean symlinks
* `rake symlink:force`: clean symlinks and re-link
* `rake symlink:zsh_themes`: link the zsh themes inside `zsh/themes` to
  `~/.oh-my-zsh/themes`

* `rake setup:filesystem`: create a bunch of useful directories
* `rake setup:zsh_syntax_highlighting`: install zsh syntax highlighting

**Important**: if you're setting up a new machine and you get a "no implicit
conversion of nil into String" error when running rake, just do:

    export DOTFILES=$HOME/dotfiles


## Contents

### Zsh

I use zsh. I use it with the
[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) framework since it
provides some defaults I like. Maybe I'll drop it someday since it's quite big
and I use just a little fraction of its features, but for now I'll stick to it.
The installation above includes cloning oh-my-zsh too.

In order to keep everything neat, I have all the zsh related stuff inside
`zsh/`. Aliases are inside `zsh/aliases`, and so on.

### Vim

I like customizing vim. I like it a lot. I tend to map often, and to use as few
plugins as I can in order to keep vim light. The vim **railscasts** theme goes
along with the railscasts iTerm 2 theme inside `iterm2/`.

Maybe it slows vim down a little (on startup), but I like to keep my `vimrc`
organized and clean. To do that, I split it into a bunch of files inside
`vim/rc/`, which I subsequently `source` in strategic points inside `vimrc`.

`vimrc` is actually a work in progress, since I'm adding stuff to it on a daily
basis. If you fork this repo and need stuff like additional filetypes let me
know or make a pull request.

Before running `:BundleInstall`, be sure to install Vundle!

    git clone https://github.com/gmarik/Vundle.vim

### Tmux

I recently became an avid `tmux` user. I use it along with
[tmuxinator](https://github.com/tmuxinator/tmuxinator) and I think it's great.
I'm still avoiding versioning my tmuxinator presets since I switch from a
desktop machine to a laptop pretty often and I'm not sure it would make sense to
share the same layouts.

### Git

I use git a lot and I aliased some git specific stuff inside `git/gitconfig`.
I also use a custom git template directory (through an environment variable set
in `zsh/exports`) in order to shoot gitshots when committing.


## A note about bash

The repository still contains some bash configurations. I'll probably delete
that stuff, or leave it on a side branch.
