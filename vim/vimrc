" Get rid of the vi stuff and fully embrace vim.
set nocompatible

" Source bundles.
source ~/.vim/rc/plugins.vim

" Plugin development.
set rtp+=~/Code/vim-sinatra
set rtp+=~/Code/vim-rack

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
let g:light_colorscheme = 'hemisu-light'
let g:dark_colorscheme = 'railscasts'

" Light theme during day hours, dark otherwise.
call ColorschemeBasedOnTime()


" Tmuxline
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_preset = {
  \ 'a'    : '#S',
  \ 'b'    : '#{pane_current_path}',
  \ 'c'    : '%l:%M %p',
  \ 'win'  : '#I #W',
  \ 'cwin' : '#I #W',
  \ 'x'    : '#(osx-battery)',
  \ 'y'    : '#(whoami)',
  \ 'z'    : '#h' }
