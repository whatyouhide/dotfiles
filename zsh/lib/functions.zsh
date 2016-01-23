# Use git in a cooler way: 'g' for status, g {args} for normal git.
# If 'hub' is available, use 'hub' as git.
git() {
  local cmd='git'
  command-exists hub && cmd='hub'
  ([[ $# > 0 ]] && command "$cmd" "$@") || command "$cmd" status
}

# Quickly open a new tmux session.
sess() {
  local default_name=$(date +"%T")
  local name=${1:-hack-$default_name}
  TMUX= command tmux new-session -d -s "$name"
  command tmux switch-client -t "$name"
}
