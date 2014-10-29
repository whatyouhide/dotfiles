# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Make vim the default editor and MacVim the default visual editor.
export EDITOR=vim
export VISUAL=vim

# Don’t clear the screen after quitting less and make less quit itself
# when the content fits one screen.
_LESS="less --no-init --quit-if-one-screen"
export MANPAGER="$_LESS"
export PAGER="$_LESS"

# Template directory which git uses when you 'git init'.
export GIT_TEMPLATE_DIR="$DOTFILES/git/git-template-dir"

# Options for Homebrew Cask.
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export GOPATH="$HOME/Code/gocode"

# CUSTOM EXPORTS

# Where to store gitshots.
export GITSHOTS="$HOME/Copy/Images/gitshots"

# Whether to autostart tmux when sourcing zshrc, defaulting to true. This
# options is meant to be overridden in zsh/extra, which is sourced after every
# other file.
export AUTOSTART_TMUX=true
