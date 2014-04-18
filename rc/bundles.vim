" Plugins (with Vundle)
" ====================


" Required by vundle.
filetype off

" Set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle, required.
Bundle 'gmarik/vundle'

" Generic bundles.
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'airblade/vim-gitgutter'
Bundle 'kien/ctrlp.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'matze/vim-move'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'junegunn/goyo.vim'
Bundle 'tommcdo/vim-exchange'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'whatyouhide/vim-rant'
Bundle 'thoughtbot/vim-rspec'
Bundle 'Raimondi/delimitMate'
" Text objects.
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-entire'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'b4winckler/vim-angry'
" Language specific.
Bundle 'vim-ruby/vim-ruby'
Bundle 'kchmck/vim-coffee-script'
Bundle 'othree/html5.vim'
Bundle 'elixir-lang/vim-elixir'
Bundle 'plasticboy/vim-markdown'
" Themes.
Bundle 'chriskempson/base16-vim'


" Enable file type detection and do language-dependent indenting (this
" also 'closes' vundle, and it's *required*).
filetype plugin indent on
