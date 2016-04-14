# Quickly open a new tmux session.
sess() {
  local default_name=$(date +"%T")
  local name=${1:-hack-$default_name}
  TMUX= command tmux new-session -d -s "$name"
  command tmux switch-client -t "$name"
}
