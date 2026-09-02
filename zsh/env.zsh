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
# The first run in a shell starts from a clean slate. Later runs keep the
# current PATH and move our entries back to the front; `typeset -U` drops the
# duplicates. macOS login shells need the second run: /etc/zprofile runs
# path_helper after ~/.zshenv and moves /usr/bin & co. in front of Homebrew,
# so ~/.zprofile sources this file again (see install.sh). The guard is not
# exported on purpose, so child shells start from a clean slate again.
if [[ -z "$_dotfiles_path_set" ]]; then
    path=()
fi
typeset -g _dotfiles_path_set=1
typeset -U path
path=(
    "$HOME/bin"
    /usr/local/sbin
    /usr/local/bin
    /usr/bin
    /usr/sbin
    /bin
    /sbin
    "$HOME/.cargo/bin"
    "$HOME/.local/bin"
    $path
)
export PATH

export EDITOR="vim"

# macOS-only bits. This file is also sourced on Linux devboxes,
# where none of this applies. Must come before the asdf
# line below so asdf shims stay in front of the Homebrew paths.
if [[ "$OSTYPE" == darwin* ]]; then
    # Homebrew
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # Necessary to work around issues in Ansible
    export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

    # This fixes a bunch of headaches on macOS when installing Erlang with asdf/kerl.
    export KERL_CONFIGURE_OPTIONS="--with-ssl=$(brew --prefix openssl@3) --with-wx-config=$(brew --prefix wxwidgets)/bin/wx-config --without-javac --without-odbc"

    # Java (if installed).
    if java -version >/dev/null 2>&1; then
        export JAVA_HOME="$(/usr/libexec/java_home -v 11)"
    fi

    # Who can remember the path to the iCloud directory?
    export ICLOUD_DIR="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
fi

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# mise shims, so non-interactive shells (ssh host 'cmd', dotfiles-sync) find
# mise-managed tools. Interactive shells get the full `mise activate` in
# config.zsh, which overrides the shims.
export PATH="${MISE_DATA_DIR:-$HOME/.local/share/mise}/shims:$PATH"

# Enable shell history in Erlang/Elixir.
export ERL_AFLAGS="-kernel shell_history enabled"

# Use a TTY in GPG.
export GPG_TTY="$(tty)"
