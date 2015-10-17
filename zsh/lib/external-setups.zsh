# Kiex
[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"

# Direnv
command-exists direnv && eval "$(direnv hook zsh)"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# exenv
export PATH="$HOME/.exenv/bin:$PATH"
eval "$(exenv init -)"
