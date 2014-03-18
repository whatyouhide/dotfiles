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

" Don't keep nasty swap/tmp/backup files. No more ~.
set nobackup
set nowritebackup
set noswapfile 

" Change the leader from '\' to ','.
let mapleader=","

" Turn spell-checking on for git commit messages.
autocmd FileType gitcommit setlocal spell

" Remappings.
" Distraction free mode (using Goyo).
nnoremap <Leader>m :Goyo<CR>

" Plugins (using vim-plug, more of which here:
" https://github.com/junegunn/vim-plug)
call plug#begin()
Plug 'junegunn/goyo.vim'
call plug#end()

" Goyo configuration.
let g:goyo_margin_top = 1
let g:goyo_margin_bottom = 1

