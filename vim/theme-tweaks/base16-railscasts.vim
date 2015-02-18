" Stuff specific to the **railscasts** theme.
" (https://github.com/chrishunt/color-schemes)
let g:airline_theme = 'base16'

" Terminal vim (used with iTerm 2)
" --------------------------------

highlight VertSplit    ctermbg=236
highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
highlight ColorColumn  ctermbg=236
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine   ctermbg=238 ctermfg=12
highlight IncSearch    ctermbg=4   ctermfg=8
highlight Search       ctermbg=2   ctermfg=8
highlight Visual       ctermbg=3   ctermfg=0
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=0   ctermfg=3
highlight SpellBad     ctermbg=0   ctermfg=1

" TODO, FIXME etc.
highlight Todo         ctermbg=0   ctermfg=5

" Folding.
highlight Folded       ctermbg=238 ctermfg=2

" Lines that go over 80 chars.
highlight OverLength ctermbg=red ctermfg=white

" GitGutter.
highlight SignColumn               ctermbg=236
highlight GitGutterAdd             ctermbg=236
highlight GitGutterChange          ctermbg=236
highlight GitGutterDelete          ctermbg=236
highlight GitGutterChangeDelete    ctermbg=236

" Tab bar.
highlight TabLine      ctermfg=240 ctermbg=236
highlight TabLineSel               ctermbg=237
highlight TabLineFill              ctermbg=236


" GUI vim overrides
" -----------------

highlight LineNr                   guibg=#313131 guifg=#6a6b6b
highlight CursorLine               guibg=#313131
highlight CursorLineNr             guibg=#313131 guifg=#6a6b6b
highlight CursorLine               guibg=#313131
highlight SignColumn               guibg=#313131

highlight GitGutterAdd             guibg=#313133
highlight GitGutterChange          guibg=#313131
highlight GitGutterDelete          guibg=#313131
highlight GitGutterChangeDelete    guibg=#313131
