# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Path to the dotfiles.
export DOTFILES="$HOME/dotfiles"

# Set other oh-my-zsh options (obviously keep this before the oh-my-zsh
# sourcing in order for oh-my-zsh to see these options). Also set the $PATH
# before oh-my-zsh in order to solve some issues with RVM.
source $DOTFILES/zsh/zsh-options
source $DOTFILES/zsh/functions
source $DOTFILES/zsh/path

# Source oh-my-zsh.
source $ZSH/oh-my-zsh.sh

# WTF I want my effing aliases who are you? You're not my real mother
# (remove all the default oh-my-zsh aliases and use custom aliases)
unalias -m "*" && source "$DOTFILES/zsh/aliases"

# Redefine some exports since oh-my-zsh takes a whole bunch of liberties
# in doing that (see PAGER="less" and not "less -X").
source "$DOTFILES/zsh/exports"

# Last but not least, source some 'extra' configurations.
# These are not version controlled and may be used for workstation-specific
# stuff.
[[ -f "$DOTFILES/zsh/extra" ]] && source "$DOTFILES/zsh/extra"

# Source RVM.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Use Ctrl-s everywhere. In vim for example.
stty -ixon
