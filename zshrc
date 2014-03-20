# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="suvash"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

# Set other oh-my-zsh options (obviously keep this before the oh-my-zsh
# sourcing in order for oh-my-zsh to see these options). Also set the $PATH
# before oh-my-zsh in order to solve some issues with RVM.
source ~/.dotfiles/zsh/zsh-options
source ~/.dotfiles/zsh/path

# Source oh-my-zsh.
source $ZSH/oh-my-zsh.sh

# WTF I want my effing aliases who are you? You're not my real mother
# (remove all the default oh-my-zsh aliases and use custom aliases)
unalias -m "*" && source ~/.dotfiles/zsh/aliases

# Redefine some exports since oh-my-zsh takes a whole bunch of liberties
# in doing that (see PAGER="less" and not "less -X").
source ~/.dotfiles/zsh/exports

# Source RVM.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Source z, oh god z.
. ~/.z-code/z.sh
