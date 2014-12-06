# Use git in a cooler way: 'g' for status, g {args} for normal git.
# If 'hub' is available, use 'hub' as git.
compdef g=git
g() {
  local cmd='git'
  command-exists hub && cmd='hub'
  ([[ $# > 0 ]] && command "$cmd" "$@") || command "$cmd" status
}


# Zip a given directory to an archive with the same {name}.zip and use a bunch
# of useful OSX-oriented options.
zeep() {
  local target=$1
  zip -r "$1.zip" -x '*.DS_Store' -9
}


# Serve the current directory on a given port, which defaults to 3000.
serve() {
  port="${1:-3000}"
  ruby -run -e httpd . -p $port
}


# Quickly open a new tmux session.
sess() {
  local default_name=$(date +"%T")
  local name=${1:-hack-$default_name}
  TMUX= command tmux new-session -d -s "$name"
  command tmux switch-client -t "$name"
}
