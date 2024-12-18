# -*- mode: shellscript -*-

if [[ -z "$ZSH_CONFIG" ]]; then
    echo "You need to set the ZSH_CONFIG env variable to the path where"
    echo "the zsh config is located. You can do that in ~/.zshenv"
fi

# Stuff that doesn't export environment variables (those go in .zshenv).
source "$ZSH_CONFIG/lib/fpath.zsh"
source "$ZSH_CONFIG/lib/options.zsh"
source "$ZSH_CONFIG/lib/zstyle.zsh"
source "$ZSH_CONFIG/lib/keybindings.zsh"
source "$ZSH_CONFIG/lib/autoloads.zsh"
source "$ZSH_CONFIG/lib/aliases.zsh"
source "$ZSH_CONFIG/lib/dotenv.zsh"
source "$ZSH_CONFIG/lib/hooks.zsh"

# Source antigen bundles and apply everything
source $(brew --prefix)/share/antigen/antigen.zsh
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle hlissner/zsh-autopair
antigen apply

type direnv >/dev/null && eval "$(direnv hook zsh)"

# Choose the prompt.
prompt "andrea"
