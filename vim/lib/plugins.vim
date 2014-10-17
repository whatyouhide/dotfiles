call plug#begin('~/.vim/bundle')

" Source local plugins before everything else (in order to be able to override
" existing plugins).
if filereadable(expand("~/.vim/works-in-progress.vim"))
  source ~/.vim/works-in-progress.vim
endif

" Generic bundles.
Plug 'tpope/vim-surround'       " No need to explain :)
Plug 'tpope/vim-dispatch'       " Wow! Run stuff ansynchronously
Plug 'tpope/vim-fugitive'       " Git wrapper
Plug 'tpope/vim-endwise'        " Add 'end', 'endfunction' and so on
Plug 'tpope/vim-repeat'         " Repeat custom commands
Plug 'tpope/vim-unimpaired'     " Use [ and ], often
Plug 'tpope/vim-eunuch'         " Unix utilities
Plug 'tpope/vim-vinegar'
Plug 'kien/ctrlp.vim'
Plug 'tomtom/tcomment_vim'
Plug 'SirVer/ultisnips'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'itspriddle/vim-stripper'
Plug 'benmills/vimux'

" Approving.
Plug 'schickling/vim-bufonly'
Plug 'Arkham/vim-quickfixdo'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-scripts/paredit.vim'
Plug 'sunaku/vim-ruby-minitest'

" Text manipulation.
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tommcdo/vim-exchange'
Plug 'junegunn/vim-easy-align', { 'on': ['EasyAlign', 'LiveEasyAlign'] }
Plug 'matze/vim-move', { 'on': [
      \ '<Plug>MoveBlockDown', '<Plug>MoveBlockUp',
      \ '<Plug>MoveLineDown', '<Plug>MoveLineUp'] }

" Aesthetic.
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }

" Misc.
Plug 'mattn/webapi-vim', { 'on': 'Gist' }
Plug 'mattn/gist-vim', { 'on': 'Gist' }
Plug 'sjl/strftimedammit.vim'

" Text objects.
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'whatyouhide/vim-textobj-erb'
Plug 'whatyouhide/vim-textobj-xmlattr'
Plug 'thinca/vim-textobj-between'
Plug 'PeterRincker/vim-argumentative'


" OSX only.
Plug 'henrik/vim-reveal-in-finder', { 'on': 'Reveal' }
Plug 'itspriddle/vim-marked', { 'for': 'mkd', 'on': 'MarkedOpen' }

" Plugin development.
Plug 'kana/vim-vspec'
Plug 'junegunn/vader.vim', { 'on': 'Vader', 'for': 'Vader' }

" Language specific.
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'vim-ruby/vim-ruby'
Plug 'othree/html5.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'plasticboy/vim-markdown', { 'for': 'mkd' }
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'elixir-lang/vim-elixir'
Plug 'wlangstroth/vim-racket'
Plug 'fatih/vim-go'
Plug 'guns/vim-clojure-static'

" Colorschemes.
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'

call plug#end()
