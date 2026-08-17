# -*- mode: shellscript -*-

# This gets sourced by ~/.zshrc. See install.sh for more details.

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

# This seems good for lots of open files and Docker and stuff. I'm too lazy
# to dig deeper.
ulimit -n 65536

# Source antigen bundles and apply everything. Antigen comes from Homebrew on
# macOS and from the zsh-antigen apt package on the (Ubuntu) dev box.
if [[ -e /usr/share/zsh-antigen/antigen.zsh ]]; then
    source /usr/share/zsh-antigen/antigen.zsh
else
    source "$(brew --prefix)/share/antigen/antigen.zsh"
fi
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle hlissner/zsh-autopair
antigen apply

# Choose the prompt.
prompt "andrea"

# When SSH'd in, prepend the hostname so it's obvious
# the shell is remote.
if [[ -n "$SSH_CONNECTION" || -n "$SSH_TTY" ]]; then
    PROMPT="%F{cyan}[%m] %f$PROMPT"
fi

type direnv >/dev/null && eval "$(direnv hook zsh)"
type mise >/dev/null && eval "$(mise activate zsh)"

# Worktrunk
if command -v wt > /dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi
