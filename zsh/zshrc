source "$ZSH/fpath"
source "$ZSH/autoloads"
source "$ZSH/functions"
source "$ZSH/path"
source "$ZSH/aliases"
source "$ZSH/exports"

[[ -f "$DOTFILES/colorschemes" ]] && source "$DOTFILES/colorschemes"
[[ -f "$ZSH/extra" ]] && source "$ZSH/extra"

source "$ZSH/external-setups"

setopt auto_cd
cdpath=($HOME $HOME/Sites $HOME/Code $HOME/Dropbox)

# Source all the keybindings here because they don't work otherwise. Computers.
source "$ZSH/keybindings"

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

# Use Ctrl-s everywhere. In vim for example.
stty -ixon

if   $AUTOSTART_TMUX            \
  && type tmux >/dev/null 2>&1  \
  && [[ `tmux -V` =~ 1.9 ]]     \
  && [[ -z $TMUX ]]
then
  tmux new-session -As hack
fi
