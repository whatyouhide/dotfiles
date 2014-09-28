" Choose a dark and a light themes...
let g:term_colorscheme = $DOTFILES_VIM_TERM_COLORSCHEME
let g:gui_colorscheme = $DOTFILES_VIM_GUI_COLORSCHEME
" ...with defaults.
if empty(g:term_colorscheme) | let g:term_colorscheme = 'base16-ocean' | endif
if empty(g:gui_colorscheme)  | let g:gui_colorscheme = 'base16-ocean'  | endif


exec 'colorscheme ' . {has('gui_running') ? 'gui' : 'term'}_colorscheme
