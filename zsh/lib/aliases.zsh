# `ls`.
# Detect which `ls` flavor is in use.
# List all files colorized in long format, including dot files
if ls --color > /dev/null 2>&1; then
  colorflag="--color" # GNU `ls`
else
  colorflag="-G"      # OS X `ls`
fi
alias l="ls -lAFh ${colorflag}"

# `cat` with beautiful colors. Requires Pygments installed.
if command-exists pygmentize; then
  alias cat='pygmentize -O style=friendly -f console256 -g'
fi

# todo.txt
command-exists 'todo.sh' && alias t=todo.sh

# tmux.
alias thack='tmux new-session -As hack'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"

# Recursively delete `.DS_Store` files
alias clean-ds-stores="find . -name '*.DS_Store' -type f -ls -delete"
