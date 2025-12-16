# `ls` replacement.
alias l="eza --long --binary --group --classify --git --all"

alias ll="tree --gitignore --du -h -C -p"

# `cat` replacement. Configured in `bat/config`.
alias cat="bat"

# Recursively delete `.DS_Store` files
alias clean-ds-stores="find . -name '*.DS_Store' -type f -ls -delete"

alias ip="curl ifconfig.me"

# Docker and Kubernetes.
alias kctx="kubectx"
alias k="kubectl"
