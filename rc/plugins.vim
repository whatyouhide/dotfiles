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
" Git wrapper.
Plugin 'tpope/vim-fugitive'
" Add 'end's here and there in Ruby, Vimscript.
Plugin 'tpope/vim-endwise'
" Repeat custom commands.
Plugin 'tpope/vim-repeat'
" GitGutter, no presentation needed.
Plugin 'airblade/vim-gitgutter'
" Fuzzy file finder (with MRU too).
Plugin 'kien/ctrlp.vim'
" Comment stuff with 'gc'.
Plugin 'tomtom/tcomment_vim'
" Move lines/visually selected blocks up and down with some custom mappings.
Plugin 'matze/vim-move'
" Kind of a project drawer.
Plugin 'scrooloose/nerdtree'
" Syntax checker.
Plugin 'scrooloose/syntastic'
" Better (maybe?) status line.
Plugin 'bling/vim-airline'
" <Tab> to snip. Snippets are in ~/.vim/UltiSnips.
Plugin 'SirVer/ultisnips'
" Distraction Free mode.
Plugin 'junegunn/goyo.vim'
" Exchange the position of text objects.
Plugin 'tommcdo/vim-exchange'
" :Gist stuff.
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
" Run the current buffer in a tmux pane.
Plugin 'whatyouhide/vim-rant'
" Run specs inside vim.
Plugin 'thoughtbot/vim-rspec'

" Text objects.
" Keep it all working.
Plugin 'kana/vim-textobj-user'
" e: entire file.
Plugin 'kana/vim-textobj-entire'
" r: Ruby block.
Plugin 'nelstrom/vim-textobj-rubyblock'
" a: function argument.
Plugin 'b4winckler/vim-angry'
" c: comment.
Plugin 'glts/vim-textobj-comment'

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


" Themes.
Plugin 'chriskempson/base16-vim'


call vundle#end()

" Enable file type detection and do language-dependent indenting (this
" also 'closes' vundle, and it's *required*).
filetype plugin indent on
