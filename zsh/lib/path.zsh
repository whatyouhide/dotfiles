# Make sure that the PHP install in MAMP is the first one if we're on OSX.
is-osx && export PATH=/Applications/MAMP/bin/php/php5.5.10/bin

# Standard PATH entries.
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/bin
export PATH=$PATH:/sbin

# RVM.
export PATH=$PATH:$HOME/.rvm/bin

# bin/ directory in the dotfiles.
export PATH=$PATH:$DOTFILES/bin