" Get rid of the vi stuff and fully embrace vim.
set nocompatible


" Source plugins I'm developing (works-in-progress.vim is not version
" controlled) before regular plugins, in order to be able to have plugin
" dopplegangers.
if filereadable(expand("~/.vim/works-in-progress.vim"))
  source ~/.vim/works-in-progress.vim
endif

" Plugins.
source ~/.vim/lib/plugins.vim


" Enable file type detection and do language-dependent indenting (this
" also 'closes' vundle, and it's *required*).
filetype plugin indent on

" Turn on syntax highlighting.
syntax on


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
