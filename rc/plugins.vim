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
Plugin 'tpope/vim-surround'       " No need to explain :)
Plugin 'tpope/vim-fugitive'       " Git wrapper
Plugin 'tpope/vim-endwise'        " Add 'end', 'endfunction' and so on
Plugin 'tpope/vim-repeat'         " Repeat custom commands
Plugin 'tpope/vim-dispatch'       " Wow! Run stuff ansynchronously
Plugin 'tpope/vim-unimpaired'     " Use [ and ], often

Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'SirVer/ultisnips'

" Text manipularion.
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'tommcdo/vim-exchange'
Plugin 'PeterRincker/vim-argumentative'
Plugin 'matze/vim-move'

" Visual.
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'bling/vim-airline'
Plugin 'junegunn/goyo.vim'        " Distraction-free mode

Plugin 'mattn/webapi-vim'         " Required by gist-vim
Plugin 'mattn/gist-vim'           " :Gist portions of text

Plugin 'kien/rainbow_parentheses.vim'
Plugin 'takac/vim-hardtime'

" Text objects.
Plugin 'kana/vim-textobj-user'    " Required by many
Plugin 'kana/vim-textobj-entire'  " Entire file
Plugin 'nelstrom/vim-textobj-rubyblock'

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
