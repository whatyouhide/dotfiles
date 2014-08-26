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

setopt PROMPT_SUBST
prompt $DOTFILES_ZSH_PROMPT

# zstyle options.
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''

# Use Ctrl-s everywhere. In vim for example.
stty -ixon

if   $AUTOSTART_TMUX            \
  && type tmux >/dev/null 2>&1  \
  && [[ `tmux -V` =~ 1.9 ]]     \
  && [[ -z $TMUX ]]
then
  tmux new-session -As hack
fi
