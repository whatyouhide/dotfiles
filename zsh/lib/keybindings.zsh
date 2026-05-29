# Set emacs mode for zle.
bindkey -e

# Bind Ctrl-p and Ctrl-n (in emacs mode) to zsh-history-substring-search.
zle -N history-substring-search-up
zle -N history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# Bind Up and Down arrows to the classic history search, which searches for a
# command matching whatever is already sitting on the command line.
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
# Here do the same but for some SSH terminals and other stuff that I don't care researching really.
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search
