" Plugins (with Vundle)
" ====================


" Required by vundle.
filetype off

" Set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required.
Plugin 'gmarik/Vundle.vim'

" Generic bundles.

" Surround text and change it and everything. Awesome.
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-dispatch'       " Wow! Run stuff ansynchronously
Plugin 'tpope/vim-unimpaired'     " Use [ and ], often

Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tommcdo/vim-exchange'     " Exchange the position of text objects
Plugin 'matze/vim-move'
Plugin 'airblade/vim-gitgutter'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'bling/vim-airline'
Plugin 'junegunn/goyo.vim'        " Distraction-free mode
Plugin 'mattn/webapi-vim'         " Required by gist-vim
Plugin 'mattn/gist-vim'           " :Gist portions of texth

Plugin 'kien/rainbow_parentheses.vim'

Plugin 'takac/vim-hardtime'
Plugin 'sjl/gundo.vim'

" Text objects.
Plugin 'kana/vim-textobj-user'    " Required by many
Plugin 'kana/vim-textobj-entire'  " Entire file
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'b4winckler/vim-angry'
Plugin 'glts/vim-textobj-comment'

" OSX only.
Plugin 'henrik/vim-reveal-in-finder'

" Language specific.
Plugin 'vim-ruby/vim-ruby'
Plugin 'kchmck/vim-coffee-script'
Plugin 'othree/html5.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'derekwyatt/vim-scala'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'thoughtbot/vim-rspec'

" Themes.
Plugin 'chriskempson/base16-vim'


call vundle#end()

" Enable file type detection and do language-dependent indenting (this
" also 'closes' vundle, and it's *required*).
filetype plugin indent on
