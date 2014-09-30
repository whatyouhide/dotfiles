# Try to autocorrect commands.
setopt correct

# Use cool globbing options.
setopt extended_glob

# Expand stuff, perform substitutions and so on in the prompt.
setopt prompt_subst

# No beeps.
setopt no_beep

# Report time statistics when commands take more than 'n' seconds to run (system
# + user).
export REPORTTIME=3


# Completion

# Show completion menu on successive tab presses.
setopt auto_menu

# On an ambiguous completion, instead of listing possibilities or beeping,
# insert the first match immediately.
unsetopt menu_complete

# The cursor is moved to the end of the word if either a single match is
# inserted or menu completion is performed.
setopt always_to_end


# Changing directories

# Make cd push the old directory onto the directory stack.
setopt auto_pushd

# Don't push multiple copies of the same directory onto the directory stack.
setopt pushd_ignore_dups

# dir = cd dir.
# The cdpath allows to cd into directories contained in the ones listed in the
# `cdpath` array, which is usually defined in a non version-controlled file.
setopt auto_cd


# History

# If HISTFILE is not set, history won't be saved :(.
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000

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

# Do not enter command lines into the history list if they are duplicates of the
# previous event, and remove older duplicates of the command from the history.
setopt hist_ignore_dups
setopt hist_ignore_all_dups

# Reduce whitespace in history commands.
setopt hist_reduce_blanks

# Expire duplicates first when the history grows too much.
setopt hist_expire_dups_first

# When searching for history entries in the line editor, do not display
# duplicates of a line previously found, even if the duplicates are not
# contiguous.
setopt hist_find_no_dups
