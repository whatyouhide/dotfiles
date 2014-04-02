" Get rid of the vi stuff and fully embrace vim.
set nocompatible

" Vundle plugin management.
" Required by vundle, actually I don't know what this does.
filetype off
" Set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Let Vundle manage Vundle, required.
Bundle 'gmarik/vundle'
" Bundles finally!
Bundle 'matze/vim-move'
Bundle 'tomtom/tcomment_vim'
Bundle 'bling/vim-airline'
Bundle 'kien/ctrlp.vim'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'junegunn/goyo.vim'
" Language specific.
Bundle 'kchmck/vim-coffee-script'
" Themes.
Bundle 'chriskempson/base16-vim'


" Enable file type detection and do language-dependent indenting (this
" also 'closes' vundle, and it's *required*).
filetype plugin indent on


" Turn on syntax highlighting.
syntax on


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


" Voodoo code for removing trailing whitespace on write.
autocmd BufWritePre * :%s/\s\+$//e

" Please save on focus lost.
autocmd FocusLost * :wa


" Turn spell-checking on for specific filltypes.
autocmd FileType gitcommit setlocal spell       " git commits :)
autocmd BufRead,BufNewFile *.md setlocal spell  " Markdown


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
" Disable Ex mode. Please.
map Q <nop>
" Ben Orenstein confessed this, who am I not to follow its lead.
inoremap <C-s> <esc>:w<CR>
" Exit from insert mode by typing 'jj'.
inoremap jj <esc>
" One less keystroke *every time*.
nnoremap ; :
" Move through splits easily.
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" Distraction free mode (using Goyo).
nnoremap <Leader>m :Goyo<CR>
" Insert a blank like below the current one using <Enter>.
nmap <CR> :set paste<CR>o<Esc>:set nopaste<CR>
" Move plugin: move lines or blocks of text up/down using Alt+j/k.
" Note that on a Mac these map to Unicode charactes, so use these:
" ∆: Alt+j
" ˚: Alt+k
nmap ∆ <Plug>MoveLineDown
nmap <A-j> <Plug>MoveLineDown
nmap ˚ <Plug>MoveLineUp
nmap <A-k> <Plug>MoveLineUp
vmap ∆ <Plug>MoveBlockDown
vmap <A-j> <Plug>MoveBlockDown
vmap ˚ <Plug>MoveBlockUp
vmap <A-k> <Plug>MoveBlockUp



" Splits handling.
" Splits 'naturally' by opening new splits below/right to the current one.
set splitbelow
set splitright


" Aesthetics stuff.
set background=dark
colorscheme base16-ocean



" Plugins configurations.
" Goyo
let g:goyo_margin_top = 1
let g:goyo_margin_bottom = 1
let g:goyo_width = 120
" Airline
set laststatus=2                                    " always show 'airline'
" Move
let g:move_map_keys = 0                             " remove default mappings
" TComment
let g:tcomment#blank_lines = 0                      " don't comment blank lines
" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
" CtrlP
let g:ctrlp_custom_ignore = '\v[\/](\.DS_Store|\.git|node_modules)$'
