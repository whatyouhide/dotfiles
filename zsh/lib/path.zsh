# Start with a clean slate, with only the scripts in the `bin` directory of the
# $DOTFILES.
PATH="$DOTFILES/bin"

# Standard PATH entries.
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/bin"
export PATH="$PATH:/sbin"

# RVM.
export PATH="$PATH:$HOME/.rvm/bin"

# Make sure that the PHP install in MAMP is the first one if we're on OSX and
# MAMP is installed.
if is-osx && is-mamp-installed; then
  export PATH="$(mamp-latest-php-bin-dir):$PATH"
fi
