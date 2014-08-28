# Make completion case insensitive.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Choose entries in the completion menu using arrow keys.
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''
# zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"

# Faster completion.
zstyle ':completion::complete:*' use-cache 1
