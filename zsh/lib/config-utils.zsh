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

# Check if MAMP is installed on the system (which obviously has to be OSX).
is-mamp-installed() {
  is-osx && [[ -d /Applications/MAMP ]]
}

# Return the path to the `bin/` directory of the latest version of the PHP
# shipped with MAMP.
mamp-latest-php-bin-dir() {
  local _pwd=$(pwd)
  local _mamp_php_dir='/Applications/MAMP/bin/php'
  local _php_versions

  cd "$_mamp_php_dir"
  _php_versions=($(ls -d php*))
  _php_latest="$_mamp_php_dir/"$_php_versions[-1]'/bin'
  cd "$_pwd"

  echo -n "$_php_latest"
}
