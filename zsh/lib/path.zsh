# Start with a clean slate, with only the scripts in the `bin` directory of the
# $DOTFILES.
PATH="$DOTFILES/bin"

# RVM (if present).
if [[ -d "$HOME/.rvm" ]]; then
  export PATH="$PATH:$HOME/.rvm/bin"
fi

# Go code.
export PATH="$PATH:$GOPATH/bin"

# Elixir.
export PATH="$PATH:$HOME/.ex_doc/bin"

# MacTex.
export PATH="$PATH:/usr/texbin"

# Standard PATH entries.
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/bin"
export PATH="$PATH:/sbin"
