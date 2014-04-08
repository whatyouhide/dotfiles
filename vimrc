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
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'airblade/vim-gitgutter'
Bundle 'junegunn/goyo.vim'
" Language specific.
Bundle 'kchmck/vim-coffee-script'
Bundle 'othree/html5.vim'
" Themes.
Bundle 'chriskempson/base16-vim'

" Enable file type detection and do language-dependent indenting (this
" also 'closes' vundle, and it's *required*).
filetype plugin indent on


" Turn on syntax highlighting.
syntax on

" Color scheme based on the current time.
" If we are between 7am and 6pm, use a light colorscheme.
if 8 < strftime("%H") && strftime("%H") < 18
  set background=light
  colorscheme base16-solarized
else
  set background=dark
  colorscheme base16-railscasts
endif
" Also, try to set a background color for the line numbers column which is
" as similar to the main background color as possible.
highlight LineNr ctermbg=0


" Tabs and backspace should behave cool, shouldn't they?
set tabstop=2                   " tabs are 2 spaces width
set expandtab                   " expand tabs to spaces
set shiftwidth=2                " indent with two spaces
set softtabstop=2               " just make this equal to shiftwidth
set backspace=indent,eol,start  " WTF backspace?


" Turn line numbers on using relative numbers. Cool. Cool cool cool.
set number


" Make the command history bigger.
set history=1000


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

" PHP files are HTML files too.
au BufRead,BufNewFile *.php set filetype=php.html

" Remappings.
" Use hjkl. You don't really have a choice.
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
" Disable Ex mode. Please.
map Q <nop>
" Ben Orenstein confessed this.
" (Ctrl-s to save and return to normal mode if previously in insert mode)
nnoremap <C-s> <Esc>:w<CR>
inoremap <C-s> <Esc>:w<CR>
" Exit from insert mode by typing 'jj'.
inoremap jj <Esc>
" One less keystroke *every time*.
nnoremap ; :
" Move through splits easily using arrows (nope, you have to move with hjkl).
nnoremap <left> <C-w>h
nnoremap <down> <C-w>j
nnoremap <up> <C-w>k
nnoremap <right> <C-w>l
" Cycle tabs using Ctrl-h/l.
nnoremap <C-h> gT
nnoremap <C-l> gt
" Insert a blank like below the current one using <Enter>.
nmap <CR> :set paste<CR>o<Esc>:set nopaste<CR>
" Distraction free mode (using Goyo).
nnoremap <Leader>m :Goyo<CR>
" <Leader>n shortcuts: they're for NERDTree.
" [n]erdtree [t]oggle: toggle NERDTree.
nnoremap <Leader>nt :NERDTreeToggle<CR>
" [n]erdtree [c]urrent: find current file in NERDTree.
nnoremap <Leader>nc :NERDTreeFind<CR>
" [n]erdtree [f]ullscreen: make NERDTree the only split in the current tab.
nnoremap <silent> <Leader>nf :NERDTreeFocus<CR>:only<CR>
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
" <Leader>v shortcuts: they are dedicated to vim stuff.
" [v]im [r]eload: reload vimrc.
nmap <Leader>vr :source ~/.vimrc<CR>
" [v]imrc [e]dit: open vimrc in a new tab.
nmap <Leader>ve :tabedit ~/.vimrc<CR>
" [v]im [b]undle [i]install: install bundles after reloading.
nmap <Leader>vbi :source ~/.vimrc<CR>:BundleInstall<CR>
" [v]im [b]undle [c]lean: clean unused bundles.
nmap <Leader>vbc :source ~/.vimrc<CR>:BundleClean<CR>



" Splits handling.
" Splits 'naturally' by opening new splits below/right to the current one.
set splitbelow
set splitright




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
" NERDTree
let NERDTreeQuitOnOpen = 1
" CtrlP
let g:ctrlp_custom_ignore = '\v[\/](\.DS_Store|\.git|node_modules)$'
let g:ctrlp_dont_split = 'nerdtree'
" GitGutter
let g:gitgutter_sign_column_always = 1
" GitGutter + railscasts?
highlight clear SignColumn
highlight GitGutterAdd ctermbg=0
highlight GitGutterChange ctermbg=0
highlight GitGutterDelete ctermbg=0
highlight GitGutterChangeDelete ctermbg=0
