# Set emacs mode for zle.
bindkey -e

# Bind Ctrl-p and Ctrl-n (in emacs mode) to zsh-history-substring-search.
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# Bind Up and Down arrows to the classic hisstory search, which searches for a
# command matching whatever is already sitting on the command line.
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
