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
Plugin 'tpope/vim-dispatch'       " Wow! Run stuff ansynchronously
Plugin 'tpope/vim-surround'       " No need to explain :)
Plugin 'tpope/vim-fugitive'       " Git wrapper
Plugin 'tpope/vim-endwise'        " Add 'end', 'endfunction' and so on
Plugin 'tpope/vim-repeat'         " Repeat custom commands
Plugin 'tpope/vim-unimpaired'     " Use [ and ], often

Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'SirVer/ultisnips'
Plugin 'terryma/vim-multiple-cursors'

" Text manipulation.
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'tommcdo/vim-exchange'
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

" Text objects.
Plugin 'kana/vim-textobj-user'    " Required by many
Plugin 'kana/vim-textobj-entire'  " Entire file
Plugin 'kana/vim-textobj-line'
Plugin 'PeterRincker/vim-argumentative'
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
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'elzr/vim-json'

" Themes.
Plugin 'chriskempson/base16-vim'
Plugin 'ricardovaleriano/vim-github-theme'
Plugin 'noahfrederick/vim-hemisu'

call vundle#end()
