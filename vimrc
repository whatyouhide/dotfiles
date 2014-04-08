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

" Generic bundles.
Bundle 'tpope/vim-surround'
Bundle 'airblade/vim-gitgutter'
Bundle 'kien/ctrlp.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'matze/vim-move'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
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
source ~/.vim/rc/theme-setups/railscasts.vim



" Tabs and backspace should behave cool, shouldn't they?
set tabstop=2                   " tabs are 2 spaces width
set expandtab                   " expand tabs to spaces
set shiftwidth=2                " indent with two spaces
set softtabstop=2               " just make this equal to shiftwidth
set backspace=indent,eol,start  " WTF backspace?


" Turn line numbers on using relative numbers. Cool. Cool cool cool.
set relativenumber


" Highlight current line.
set cursorline


" Highlight the part of the line that goes over 80 characters.
highlight OverLength ctermbg=red ctermfg=white
match OverLength /\%81v.\+/


" Start scrolling when there are n lines between the cursor and the
" top/bottom of the screen.
set scrolloff=5


" Don't keep nasty swap/tmp/backup files. No more ~.
set nobackup
set nowritebackup
set noswapfile


" Change the leader from '\' to ','.
let mapleader=","


augroup vimrc_autocmds
  autocmd!

  " Remove trailing whitespace on write.
  autocmd BufWritePre * :%s/\s\+$//e

  " Turn spell-checking on for specific filetypes.
  autocmd FileType gitcommit setlocal spell       " git commits :)
  autocmd BufRead,BufNewFile *.md setlocal spell  " Markdown

  " PHP files are HTML files too.
  autocmd BufRead,BufNewFile *.php set filetype=php.html
augroup END


" Mappings.
source ~/.vim/rc/mappings.vim


" Splits handling.
" Splits 'naturally' by opening new splits below/right to the current one.
set splitbelow
set splitright


" Plugins configurations.
source ~/.vim/rc/plugin-configs.vim
