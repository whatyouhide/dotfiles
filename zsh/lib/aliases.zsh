# `ls` replacement.
alias l="exa --long --binary --group --classify --git --all"

# `cat` replacement.
alias cat="bat --paging=never --theme=base16 --style=header-filename,header-filesize,grid"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Recursively delete `.DS_Store` files
alias clean-ds-stores="find . -name '*.DS_Store' -type f -ls -delete"
