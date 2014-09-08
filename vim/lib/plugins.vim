" Plugins (with Vundle)
" ====================

" Required by vundle.
filetype off

" Set the runtime path to include Vundle and initialize.
" set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required.
Plugin 'gmarik/Vundle.vim'

" Generic bundles.
Plugin 'tpope/vim-surround'       " No need to explain :)
Plugin 'tpope/vim-dispatch'       " Wow! Run stuff ansynchronously
Plugin 'tpope/vim-fugitive'       " Git wrapper
Plugin 'tpope/vim-endwise'        " Add 'end', 'endfunction' and so on
Plugin 'tpope/vim-repeat'         " Repeat custom commands
Plugin 'tpope/vim-unimpaired'     " Use [ and ], often
Plugin 'tpope/vim-eunuch'         " Unix utilities
Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'SirVer/ultisnips'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'rking/ag.vim'

" Text manipulation.
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'tommcdo/vim-exchange'
Plugin 'matze/vim-move'

" Aesthetic.
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'bling/vim-airline'
Plugin 'junegunn/goyo.vim'        " Distraction-free mode

" Misc.
Plugin 'mattn/webapi-vim'         " Required by gist-vim
Plugin 'mattn/gist-vim'           " :Gist portions of text

" Text objects.
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-line'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'whatyouhide/vim-textobj-erb'
Plugin 'whatyouhide/vim-textobj-xmlattr'
Plugin 'PeterRincker/vim-argumentative'

" OSX only.
Plugin 'henrik/vim-reveal-in-finder'

" Plugin development.
Plugin 'kana/vim-vspec'

" Language specific.
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'vim-ruby/vim-ruby'
Plugin 'othree/html5.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'mattn/emmet-vim'
Plugin '2072/vim-syntax-for-PHP'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'elzr/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'elixir-lang/vim-elixir'

" Themes.
Plugin 'chriskempson/base16-vim'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
