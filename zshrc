# Path to your oh-my-zsh configuration.
ZSH=/Users/ironmac/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="random"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

# Source zsh.
source $ZSH/oh-my-zsh.sh

# WTF I want my effing aliases who are you? You're not my real mother
# (remove all the default oh-my-zsh aliases)
unalias -m "*"

# Source other configuration files.
source ~/.dotfiles/zsh/aliases
source ~/.dotfiles/zsh/zsh-options
source ~/.dotfiles/zsh/path
source ~/.dotfiles/zsh/exports
