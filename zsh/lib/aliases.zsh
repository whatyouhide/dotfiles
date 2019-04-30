# `ls`.
# Detect which `ls` flavor is in use.
# List all files colorized in long format, including dot files
if ls --color > /dev/null 2>&1; then
  colorflag="--color" # GNU `ls`
else
  colorflag="-G"      # OS X `ls`
fi
alias l="ls -lAFh ${colorflag}"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Recursively delete `.DS_Store` files
alias clean-ds-stores="find . -name '*.DS_Store' -type f -ls -delete"
