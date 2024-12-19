# -*- mode: shellscript -*-

# Path to the dotfiles.
export DOTFILES="$HOME/dotfiles"

# zsh config.
export ZSH_CONFIG="$DOTFILES/zsh"

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Don’t clear the screen after quitting less and make less quit itself
# when the content fits one screen.
_LESS="less --no-init --quit-if-one-screen"
export MANPAGER="$_LESS"
export PAGER="$_LESS"

## Path
# Start with a clean slate, with only the scripts in `~bin`.
PATH="$HOME/bin"
# Standard PATH entries.
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/bin"
export PATH="$PATH:/sbin"
# Tools I generally use.
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/bin"

export EDITOR="code --wait"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# asdf
. "$(brew --prefix asdf)/libexec/asdf.sh"

# Necessary to work around issues in Ansible
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Enable shell history in Erlang/Elixir.
export ERL_AFLAGS="-kernel shell_history enabled"

# Use a TTY in GPG.
export GPG_TTY="$(tty)"

# This fixes a bunch of headaches on macOS when installing Erlang with asdf/kerl.
export KERL_CONFIGURE_OPTIONS="--with-ssl=$(brew --prefix openssl@1.1) --with-wx-config=$(brew --prefix wxwidgets)/bin/wx-config --without-javac --without-odbc"

# Java (if installed).
type java &>/dev/null && export JAVA_HOME="$(/usr/libexec/java_home -v 11)"

[[ -s "$HOME/.zshenv-extra" ]] && source "$HOME/.zshenv-extra"
