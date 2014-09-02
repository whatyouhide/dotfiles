# Use Ctrl-z to switch back to vim.
# Look in `zsh/keybindings` for the place where this is used.
fancy-ctrl-z() {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}


# Use git in a cooler way: 'g' for status, g {args} for normal git.
# If 'hub' is available, use 'hub' as git.
compdef g=git
g() {
  local git_or_hub='git'
  command-exists hub && git_or_hub='hub'

  if [[ $# > 0 ]]; then
    command "$git_or_hub" $@
  else
    command "$git_or_hub" status
  fi
}


# Simple Python server from the current directory.
server() {
  local port="${1:-8000}"
  open "http://localhost:${port}/"
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}