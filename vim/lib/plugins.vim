call plug#begin('~/.vim/bundle')

" Source local plugins before everything else (in order to be able to override
" existing plugins).
if filereadable(expand("~/.vim/tmp-plugins.vim"))
  source ~/.vim/tmp-plugins.vim
endif

" Generic plugins.
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'kien/ctrlp.vim'
Plug 'SirVer/ultisnips'
Plug 'terryma/vim-multiple-cursors'
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'itspriddle/vim-stripper'
Plug 'benmills/vimux'
Plug 'schickling/vim-bufonly'

" Text manipulation.
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tommcdo/vim-exchange'
Plug 'junegunn/vim-easy-align'
Plug 'matze/vim-move', { 'on': [
      \ '<Plug>MoveBlockDown', '<Plug>MoveBlockUp',
      \ '<Plug>MoveLineDown', '<Plug>MoveLineUp'] }

" Aesthetic.
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }

" Text objects.
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'whatyouhide/vim-textobj-erb'
Plug 'whatyouhide/vim-textobj-xmlattr'
Plug 'PeterRincker/vim-argumentative'

" OSX only.
Plug 'henrik/vim-reveal-in-finder', { 'on': 'Reveal' }
Plug 'itspriddle/vim-marked', { 'on': 'MarkedOpen' }

" Language specific.
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'gabrielelana/vim-markdown'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'elzr/vim-json'
Plug 'cakebaker/scss-syntax.vim'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'whatyouhide/vim-tmux-syntax'
Plug 'mustache/vim-mustache-handlebars'

" Colorschemes.
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'whatyouhide/vim-gotham'

call plug#end()
