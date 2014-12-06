" Colorschemes with defaults.
if !exists('g:colorscheme_light') || empty(g:colorscheme_light)
  let g:colorscheme_light = 'base16-ocean'
endif

if !exists('g:colorscheme_dark') || empty(g:colorscheme_dark)
  let g:colorscheme_dark  = 'base16-ocean'
endif

" Day/night hours with defaults.
if !exists('g:day_starts_at') | let g:day_starts_at = 9 | endif
if !exists('g:day_ends_at')   | let g:day_ends_at = 17  | endif

let s:hour = strftime('%H')
let s:shade = (s:hour >= g:day_starts_at && s:hour < g:day_ends_at) ?
      \ 'light' : 'dark'

exec 'colorscheme ' . g:colorscheme_{s:shade}
exec 'set background=' . s:shade
