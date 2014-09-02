# Check if a command exists in the system.
command-exists() {
  local _command=$1
  type "$_command" >/dev/null 2>&1
}

# Check if the current OS is OSX.
is-osx() {
  if [[ "$(uname)" == "Darwin" ]]; then
    true
  else
    false
  fi
}

# Check if the current OS is Linux.
is-linux() {
  if [[ "$(uname)" == "Linux" ]]; then
    true
  else
    false
  fi
}
