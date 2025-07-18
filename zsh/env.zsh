# -*- mode: shellscript -*-

# This gets sourced by ~/.zshenv. See install.sh for more details.

# zsh config.
export ZSH_CONFIG="$HOME/dotfiles/zsh"

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

export EDITOR="vim"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Necessary to work around issues in Ansible
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Enable shell history in Erlang/Elixir.
export ERL_AFLAGS="-kernel shell_history enabled"

# Use a TTY in GPG.
export GPG_TTY="$(tty)"

# This fixes a bunch of headaches on macOS when installing Erlang with asdf/kerl.
export KERL_CONFIGURE_OPTIONS="--with-ssl=$(brew --prefix openssl@3) --with-wx-config=$(brew --prefix wxwidgets)/bin/wx-config --without-javac --without-odbc"

# Java (if installed).
if java -version >/dev/null 2>&1; then
    export JAVA_HOME="$(/usr/libexec/java_home -v 11)"
fi

# Who can remember the path to the iCloud directory?
export ICLOUD_DIR="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
