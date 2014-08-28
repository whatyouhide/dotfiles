# Typing is awful.
ZSH="$ZSH_CONFIG"

# Utilities for setting up zsh (functions to check for commands existence and
# other stuff like that).
source "$ZSH/lib/config-utils.zsh"

# Source standard stuff.
source "$ZSH/lib/fpath.zsh"
source "$ZSH/lib/autoloads.zsh"
source "$ZSH/lib/options.zsh"
source "$ZSH/lib/functions.zsh"
source "$ZSH/lib/path.zsh"
source "$ZSH/lib/aliases.zsh"
source "$ZSH/lib/exports.zsh"
source "$ZSH/lib/hashes.zsh"
source "$ZSH/lib/external-setups.zsh"

# Source non version controlled files only if they exist.
[[ -f "$DOTFILES/colorschemes" ]] && source "$DOTFILES/colorschemes"
[[ -f "$ZSH/extra"             ]] && source "$ZSH/extra"

# Set emacs mode for zle.
bindkey -e

# Choose the prompt.
prompt $DOTFILES_ZSH_PROMPT

# Use Ctrl-s everywhere. In vim for example.
stty -ixon

# Syntax highlighting for zsh.
source "$ZSH/external/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

if   $AUTOSTART_TMUX        \
  && command-exists tmux    \
  && [[ `tmux -V` =~ 1.9 ]] \
  && [[ -z $TMUX ]]
then
  command tmux new-session -As hack
fi
