" Get rid of the vi stuff.
set nocompatible

" Enable file type detection and do language-dependent indenting (this
" also 'closes' vundle, and it's *required*).
filetype plugin indent on

" Turn on syntax highlighting.
syntax on

" Plugins.
source ~/.vim/lib/plugins.vim

" Enable the matchit plugin.
runtime macros/matchit.vim

" External sources.
source ~/.vim/lib/options.vim
source ~/.vim/lib/functions.vim
source ~/.vim/lib/autocmds.vim
source ~/.vim/lib/commands.vim
source ~/.vim/lib/mappings.vim
source ~/.vim/lib/leader-mappings.vim
source ~/.vim/lib/plugin-configs.vim
source ~/.vim/lib/colorscheme-setup.vim

" Non version-controlled sourcing.
source ~/Dropbox/Applications/vim/*.vim
if FileExists('~/.extra.vim') | source ~/.extra.vim | endif
