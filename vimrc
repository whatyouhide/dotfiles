" Get rid of the vi stuff and fully embrace vim.
set nocompatible

" Turn on syntax highlighting.
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Tabs and backspace should behave cool, shouldn't they?
set tabstop=2                   " tabs are 2 spaces width
set expandtab                   " expand tabs to spaces
set shiftwidth=2                " indent with two spaces
set softtabstop=2               " just make this equal to shiftwidth
set backspace=indent,eol,start  " WTF backspace?

" Turn line numbers on using relative numbers. Cool. Cool cool cool.
set relativenumber

" Hide the status line by default.
set noshowmode

" Don't keep nasty swap/tmp/backup files. No more ~.
set nobackup
set nowritebackup
set noswapfile

" Change the leader from '\' to ','.
let mapleader=","

" Themeland, finally!
colorscheme mustang

" Voodoo code for removing trailing whitespace on write.
autocmd BufWritePre * :%s/\s\+$//e

" Please save on focus lost.
autocmd FocusLost * :wa

" Turn spell-checking on for git commit messages.
autocmd FileType gitcommit setlocal spell

" Remappings.
" Use hjkl. You don't really have a choice.
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
" One less keystroke *every time*.
nnoremap ; :
" Ctrl+e in order to Command+T.
nnoremap <C-e> :CtrlP<CR>
" Distraction free mode (using Goyo).
nnoremap <Leader>m :Goyo<CR>

" Plugins (using vim-plug, more of which here:
" https://github.com/junegunn/vim-plug)
call plug#begin()
Plug 'junegunn/goyo.vim'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'endel/vim-github-colorscheme'
Plug 'croaker/mustang-vim'
call plug#end()

" Goyo configuration.
let g:goyo_margin_top = 1
let g:goyo_margin_bottom = 1
let g:goyo_width = 120

" Airline configuration.
set laststatus=2 " (always show 'airline')
