# Try to autocorrect commands.
setopt correct

# Make cd push the old directory onto the directory stack.
setopt auto_pushd

# Don't push multiple copies of the same directory onto the directory stack.
setopt pushd_ignore_dups

# Use cool globbing options.
setopt extended_glob

# Expand stuff, perform substitutions and so on in the prompt.
setopt prompt_subst

# No beeps.
setopt no_beep

# dir = cd dir.
# The cdpath allows to cd into directories contained in the ones listed in
# cdpath.
setopt auto_cd
cdpath=($HOME $HOME/Sites $HOME/Code $HOME/Dropbox)

# History

export HISTSIZE=10000
export SAVEHIST=10000

# When using ! commands, print the command instead of executing it.
setopt hist_verify

# Save timestamp and duration for each command in the history.
setopt extended_history

# Don't add command to the history if they start with a space.
setopt hist_ignore_space

# Add entries to the history as commands are executed.
setopt inc_append_history

# Share history between zsh processes.
setopt share_history

# Don't overwrite history, append to it.
setopt append_history

# Ignore duplicates in the history.
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# Reduce whitespace in history commands.
setopt hist_reduce_blanks
