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

" Surround text and change it and everything. Awesome.
Bundle 'tpope/vim-surround'
" Git wrapper.
Bundle 'tpope/vim-fugitive'
" Add 'end's here and there in Ruby, Vimscript.
Bundle 'tpope/vim-endwise'
" Rmodel and stuff. Super useful.
Bundle 'tpope/vim-rails'
" Repeat custom commands.
Bundle 'tpope/vim-repeat'
" GitGutter, no presentation needed.
Bundle 'airblade/vim-gitgutter'
" Fuzzy file finder (with MRU too).
Bundle 'kien/ctrlp.vim'
" Comment stuff with 'gc'.
Bundle 'tomtom/tcomment_vim'
" Move lines/visually selected blocks up and down with some custom mappings.
Bundle 'matze/vim-move'
" Kind of a project drawer.
Bundle 'scrooloose/nerdtree'
" Better (maybe?) status line.
Bundle 'bling/vim-airline'
" <Tab> to snip. Snippets are in ~/.vim/UltiSnips.
Bundle 'SirVer/ultisnips'
" Distraction Free mode.
Bundle 'junegunn/goyo.vim'
" Exchange the position of text objects.
Bundle 'tommcdo/vim-exchange'
" :Gist stuff.
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
" Run the current buffer in a tmux pane.
Bundle 'whatyouhide/vim-rant'
" Run specs inside vim.
Bundle 'thoughtbot/vim-rspec'
" Autocomplete parens, brackets, quotes and everything.
Bundle 'Raimondi/delimitMate'

" Text objects.
" Keep it all working.
Bundle 'kana/vim-textobj-user'
" e: entire file.
Bundle 'kana/vim-textobj-entire'
" r: Ruby block.
Bundle 'nelstrom/vim-textobj-rubyblock'
" a: function argument.
Bundle 'b4winckler/vim-angry'
" c: comment.
Bundle 'glts/vim-textobj-comment'

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
