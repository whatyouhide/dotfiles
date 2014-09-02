# Command completion.
autoload -U compinit
compinit

# Command completion aliasing.
autoload -U compdef

# Colors!
autoload -U colors
colors

# Prompting.
autoload -U promptinit
promptinit

# Up and down history search in a human-friendly way.
# With an empty command line, up and down arrows go through the history (with
# the cursor staying at the end of the line); otherwise, the process is the same
# but the history is filtered with whatever is on the command line.
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
