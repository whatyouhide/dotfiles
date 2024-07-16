# `ls` replacement.
alias l="eza --long --binary --group --classify --git --all"

# `cat` replacement.
alias cat="bat --paging=never --theme=base16 --style=header-filename,header-filesize,grid"

# Recursively delete `.DS_Store` files
alias clean-ds-stores="find . -name '*.DS_Store' -type f -ls -delete"

# Docker and Kubernetes.
alias kctx="kubectx"
alias k="kubectl"
