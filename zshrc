# Utilities for setting up zsh (functions to check for commands existence and
# other stuff like that).
source "$ZSH/lib/config-utils"

source "$ZSH/lib/fpath"
source "$ZSH/lib/autoloads"
source "$ZSH/lib/functions"
source "$ZSH/lib/path"
source "$ZSH/lib/aliases"
source "$ZSH/lib/exports"

[[ -f "$DOTFILES/colorschemes" ]] && source "$DOTFILES/colorschemes"
[[ -f "$ZSH/lib/extra" ]] && source "$ZSH/lib/extra"

source "$ZSH/lib/external-setups"

setopt auto_cd
cdpath=($HOME $HOME/Sites $HOME/Code $HOME/Dropbox)

# Source all the keybindings here because they don't work otherwise. Computers.
source "$ZSH/lib/keybindings"

setopt prompt_subst
prompt $DOTFILES_ZSH_PROMPT

# zstyle options.
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


hash -d dbox=~/Dropbox
hash -d notes=~/Dropbox/Notes
hash -d code=~/Code

# Use Ctrl-s everywhere. In vim for example.
stty -ixon

if   $AUTOSTART_TMUX            \
  && type tmux >/dev/null 2>&1  \
  && [[ `tmux -V` =~ 1.9 ]]     \
  && [[ -z $TMUX ]]
then
  tmux new-session -As hack
fi
