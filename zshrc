# Path to the dotfiles.
export DOTFILES="$HOME/dotfiles"
export ZSH="$DOTFILES/zsh"

# Ensure that 'compdef' is available everywhere.
autoload -U compdef

# Use zsh-completions if present.
[[ -d /usr/local/share/zsh-completions ]] && fpath=(/usr/local/share/zsh-completions $fpath)

# Export some machine-specific variables which define the colorschemes to be
# used with vim, tmux, zsh and so on.
[[ -f "$DOTFILES/colorschemes" ]] && source "$DOTFILES/colorschemes"

# Init completion after adding zsh-completions to the path.
autoload -U compinit
compinit

# Colors everywhere.
autoload -U colors
colors

# Set other oh-my-zsh options (obviously keep this before the oh-my-zsh
# sourcing in order for oh-my-zsh to see these options). Also set the $PATH
# before oh-my-zsh in order to solve some issues with RVM.
# Note: variables prefixed with `$DOTFILES_` aren't exported in zsh/exports, but
# in $ZSH/extra and $DOTFILES/colorschemes.
source "$ZSH/functions"
source "$ZSH/path"
source "$ZSH/aliases"
source "$ZSH/exports"

# Source some extra zsh configuration. These are not version controlled and may
# be used for workstation-specific stuff.
# Sourcing this stuff last ensures options can be overridden on a per-machine
# basis.
[[ -f "$ZSH/extra" ]] && source "$ZSH/extra"

# Source RVM.
# Also ensure that RVM is reloaded when manually doing `source ~/.zshrc`. If
# rvm_reload_flag is not set, then RVM doesn't reload itself.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
export rvm_reload_flag=1

# Cd'ing everywhere. Yesss.
setopt auto_cd
cdpath=($HOME $HOME/Sites $HOME/Code $HOME/Dropbox)

# Source all the keybindings here because they don't work otherwise. Computers.
source "$ZSH/keybindings"

# Prompting.
source "$ZSH/themes/$DOTFILES_ZSH_THEME.zsh-theme"

# zstyle options.
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''

# Use Ctrl-s everywhere. In vim for example.
stty -ixon

# Load direnv if present.
type direnv >/dev/null 2>&1 && eval "$(direnv hook zsh)"

# Always inside tmux when starting: check if tmux is installed and we're not in
# a tmux session, and check that tmux is >1.9 since a lot of features (like -A
# here, and other stuff in tmux.conf) aren't compatible with <=1.8.
if   $AUTOSTART_TMUX            \
  && type tmux >/dev/null 2>&1  \
  && [[ `tmux -V` =~ 1.9 ]]     \
  && [[ -z $TMUX ]]
then
  tmux new-session -As hack
fi
