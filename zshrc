# Typing is awful.
ZSH="$ZSH_CONFIG"

# Utilities for setting up zsh (functions to check for commands existence and
# other stuff like that).
source "$ZSH/lib/config-utils.zsh"

# Source standard stuff.
source "$ZSH/lib/fpath.zsh"
source "$ZSH/lib/autoloads.zsh"
source "$ZSH/lib/functions.zsh"
source "$ZSH/lib/path.zsh"
source "$ZSH/lib/aliases.zsh"
source "$ZSH/lib/exports.zsh"
source "$ZSH/lib/external-setups.zsh"

# Source non version controlled files only if they exist.
[[ -f "$DOTFILES/colorschemes" ]] && source "$DOTFILES/colorschemes"
[[ -f "$ZSH/extra"             ]] && source "$ZSH/extra"

# Set emacs mode for zle.
bindkey -e

setopt auto_cd
cdpath=($HOME $HOME/Sites $HOME/Code $HOME/Dropbox)


setopt prompt_subst
prompt $DOTFILES_ZSH_PROMPT

# Completion options.
# Case insensitivity.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# Menu.
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''


# history
#
# When using bang commands (e.g. !!), print the command in the history instead
# of executing it.
setopt hist_verify
# Save a timestamp and duration time for each command in the history.
setopt extended_history
# Don't push commands in the history when they start with a space.
setopt hist_ignore_space
# Ignore duplicate entries when showing results.
setopt hist_ignore_all_dups
# Add entries to the history as commands are executed (not when the shell
# exits).
setopt inc_append_history
# Share history between zsh processes.
setopt share_history
# If you want to leave each zsh process with its separated history, use
# setopt append_history


# Random options.
# Disable beeps.
setopt no_beep

hash -d dbox=~/Dropbox
hash -d notes=~/Dropbox/Notes
hash -d code=~/Code

# Syntax highlighting for zsh.
source "$ZSH/external/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Use Ctrl-s everywhere. In vim for example.
stty -ixon

if   $AUTOSTART_TMUX            \
  && type tmux >/dev/null 2>&1  \
  && [[ `tmux -V` =~ 1.9 ]]     \
  && [[ -z $TMUX ]]
then
  tmux new-session -As hack
fi
