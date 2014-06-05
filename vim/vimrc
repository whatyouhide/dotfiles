" Get rid of the vi stuff and fully embrace vim.
set nocompatible

" Source bundles.
source ~/.vim/rc/plugins.vim

" Enable file type detection and do language-dependent indenting (this
" also 'closes' vundle, and it's *required*).
filetype plugin indent on

" Turn on syntax highlighting.
syntax on

" Enable the matchit plugin (required by textobj-rubyblock).
runtime macros/matchit.vim

" Source external files.
source ~/.vim/rc/options.vim
source ~/.vim/rc/functions.vim
source ~/.vim/rc/autocmds.vim
source ~/.vim/rc/commands.vim
source ~/.vim/rc/mappings.vim
source ~/.vim/rc/leader-mappings.vim
source ~/.vim/rc/plugin-configs.vim

" Choose a dark and a light themes.
let g:light_colorscheme = 'hemisu'
let g:dark_colorscheme = 'railscasts'

" Light theme between 10am and 8pm, dark otherwise.
if strftime("%H") > 10 && strftime("%H") < 20
  call SourceThemeSetup(g:light_colorscheme)
else
  call SourceThemeSetup(g:dark_colorscheme)
endif
