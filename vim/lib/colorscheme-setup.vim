" Choose a dark and a light themes...
let g:light_colorscheme = $DOTFILES_VIM_LIGHT_COLORSCHEME
let g:dark_colorscheme = $DOTFILES_VIM_DARK_COLORSCHEME
let g:gui_colorscheme = $DOTFILES_GUI_VIM_COLORSCHEME
" ...with defaults.
if empty(g:light_colorscheme) | let g:light_colorscheme = 'base16-ocean' | endif
if empty(g:dark_colorscheme)  | let g:dark_colorscheme = 'base16-ocean'  | endif
if empty(g:gui_colorscheme)   | let g:gui_colorscheme = 'base16-ocean'   | endif

" Day/night hours (used to choose between light and dark colorschemes).
let g:day_starts_at = 8
let g:day_ends_at = 19

" Light theme during day hours, dark otherwise.
call ColorschemeBasedOnTime()
