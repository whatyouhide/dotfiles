" Get rid of the vi stuff and fully embrace vim.
set nocompatible

" Turn on syntax highlighting.
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Tabs are 2 spaces width
set tabstop=2
" Expand tabs to spaces.
set expandtab
" Indent also with 2 spaces.
set shiftwidth=4

" Turn line numbers on.
set number


" Turn spell-checking on for git commit messages.
autocmd FileType gitcommit setlocal spell
