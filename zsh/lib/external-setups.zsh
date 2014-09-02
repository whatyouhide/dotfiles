# RVM.
# Also ensure that RVM is reloaded when manually doing `source ~/.zshrc`. If
# rvm_reload_flag is not set, then RVM doesn't reload itself.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
export rvm_reload_flag=1

# Direnv.
type direnv >/dev/null 2>&1 && eval "$(direnv hook zsh)"