" Ignore some directories when using CtrlP.
let g:ctrlp_custom_ignore = '\v(zsh/\.antigen|vim/bundle)$'

" Set some filetypes based on where these files are stored.
au BufRead,BufNewFile zsh/**/* set ft=zsh
au BufRead,BufNewFile tmux/**/* set ft=tmux-conf
