" Get rid of the vi stuff and fully embrace vim.
set nocompatible

" Source bundles.
source ~/.vim/rc/bundles.vim

" Enable the matchit plugin (required by textobj-rubyblock).
runtime macros/matchit.vim

" Turn on syntax highlighting and choose a theme.
syntax on
source ~/.vim/rc/theme-setups/railscasts.vim

" Highlight the part of the line that goes over 80 characters.
" (actually the highlight colors are in the theme setups, this is just
" the match definition)
match OverLength /\%81v.\+/

" Source external files.
source ~/.vim/rc/options.vim
source ~/.vim/rc/functions.vim
source ~/.vim/rc/autocmds.vim
source ~/.vim/rc/mappings.vim
source ~/.vim/rc/plugin-configs.vim
