# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Path to the dotfiles.
export DOTFILES="$HOME/dotfiles"

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
source "$DOTFILES/zsh/exports"

# Last but not least, source some 'extra' configurations.
# These are not version controlled and may be used for workstation-specific
# stuff.
[[ -f "$DOTFILES/zsh/extra" ]] && source "$DOTFILES/zsh/extra"

# Source RVM.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
# Ensure that RVM is reloaded when manually doing `source ~/.zshrc`. If this
# is not set, then RVM doesn't reload itself.
export rvm_reload_flag=1

# Cd'ing everywhere. Yesss.
setopt auto_cd
cdpath=($HOME $HOME/Sites $HOME/Code $HOME/Dropbox)

# Use Ctrl-s everywhere. In vim for example.
stty -ixon

# Always inside tmux when starting.
if type tmux >/dev/null 2>&1; then
  if [[ -z $TMUX ]]; then
    tmux attach -t hack || tmux new-session -s hack -n shell
  fi
fi
