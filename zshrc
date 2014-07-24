# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Path to the dotfiles.
export DOTFILES="$HOME/dotfiles"

# Source some extra configurations.
# These are not version controlled and may be used for workstation-specific
# stuff. These extra configurations include also vim, zsh and tmux options.
# Sourcing this stuff before everything else ensures that every configuration is
# available to the next scripts.
[[ -f "$DOTFILES/zsh/extra" ]] && source "$DOTFILES/zsh/extra"
[[ -f "$DOTFILES/colorschemes" ]] && source "$DOTFILES/colorschemes"

# Ensure that 'compdef' is available everywhere.
# oh-my-zsh sets this up too, but then I have to place stuff in a weird order in
# order to load some options and then source oh-my-zsh and then source other
# stuff.
autoload -U compinit compdef
compinit

# Set other oh-my-zsh options (obviously keep this before the oh-my-zsh
# sourcing in order for oh-my-zsh to see these options). Also set the $PATH
# before oh-my-zsh in order to solve some issues with RVM.
source "$DOTFILES/zsh/zsh-options"
source "$DOTFILES/zsh/functions"
source "$DOTFILES/zsh/path"

# Source oh-my-zsh.
source "$ZSH/oh-my-zsh.sh"

# Remove all the default oh-my-zsh aliases and use custom aliases.
unalias -m "*" && source "$DOTFILES/zsh/aliases"

# Redefine some exports since oh-my-zsh takes a whole bunch of liberties
# in doing that (see PAGER="less" and not "less -X").
# Note: variables prefixed with `$DOTFILES_` aren't exported here, but in
# $DOTFILES/zsh/extra and $DOTFILES/colorschemes.
source "$DOTFILES/zsh/exports"

# Source RVM.
# Also ensure that RVM is reloaded when manually doing `source ~/.zshrc`. If
# rvm_reload_flag is not set, then RVM doesn't reload itself.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
export rvm_reload_flag=1

# Cd'ing everywhere. Yesss.
setopt auto_cd
cdpath=($HOME $HOME/Sites $HOME/Code $HOME/Dropbox)

# Source all the keybindings here because they don't work otherwise. Computers.
source "$DOTFILES/zsh/keybindings"

# Use Ctrl-s everywhere. In vim for example.
stty -ixon

# Load direnv if present.
type direnv >/dev/null 2>&1 && eval "$(direnv hook zsh)"

# Always inside tmux when starting: check if tmux is installed and we're not in
# a tmux session, and check that tmux is >1.9 since a lot of features (like -A
# here, and other stuff in tmux.conf) aren't compatible with <=1.8.
if type tmux >/dev/null 2>&1 && [[ `tmux -V` =~ 1.9 ]] && [[ -z $TMUX ]]; then
  tmux new-session -As hack
fi
