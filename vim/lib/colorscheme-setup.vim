" Choose a dark and a light themes...
let g:colorscheme_light = $VIM_LIGHT_COLORSCHEME
let g:colorscheme_dark = $VIM_DARK_COLORSCHEME
" ...with defaults.
if empty(g:colorscheme_light) | let g:colorscheme_light = 'base16-ocean' | endif
if empty(g:colorscheme_dark)  | let g:colorscheme_dark  = 'base16-ocean' | endif

let s:hour = strftime('%H')
let s:shade = (s:hour >= 8 && s:hour < 21) ? 'light' : 'dark'

exec 'colorscheme ' g:colorscheme_{s:shade}
exec 'set background=' . s:shade
