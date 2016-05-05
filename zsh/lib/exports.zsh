# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Make vim the default editor and MacVim the default visual editor.
export EDITOR=vim
export VISUAL=vim

# Don’t clear the screen after quitting less and make less quit itself
# when the content fits one screen.
_LESS="less --no-init --quit-if-one-screen"
export MANPAGER="$_LESS"
export PAGER="$_LESS"

# CUSTOM EXPORTS

# Where to store gitshots.
export GITSHOTS="$HOME/Copy/Images/gitshots"
