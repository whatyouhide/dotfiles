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

" Hide the status line by default.
set noshowmode

" Don't keep nasty swap/tmp/backup files. No more ~.
set nobackup
set nowritebackup
set noswapfile

" Change the leader from '\' to ','.
let mapleader=","

" Voodoo code for removing trailing whitespace on write.
autocmd BufWritePre * :%s/\s\+$//e

" Turn spell-checking on for git commit messages.
autocmd FileType gitcommit setlocal spell

" Remappings.
" One less keystroke *every time*.
nnoremap ; :
" Distraction free mode (using Goyo).
nnoremap <Leader>m :Goyo<CR>

" Plugins (using vim-plug, more of which here:
" https://github.com/junegunn/vim-plug)
call plug#begin()
Plug 'junegunn/goyo.vim'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
call plug#end()

" Goyo configuration.
let g:goyo_margin_top = 1
let g:goyo_margin_bottom = 1
let g:goyo_width = 120

" Airline configuration.
set laststatus=2 " (always show 'airline')
