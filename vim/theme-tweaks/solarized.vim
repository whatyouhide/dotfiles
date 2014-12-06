if &bg ==# 'light'
  highlight SignColumn                ctermbg=7 ctermfg=4 guibg=#003742
  highlight CursorLineNr              ctermbg=7 ctermfg=4 guibg=#fdf6e3
  highlight VertSplit                 ctermbg=7 guibg=#003742
  highlight GitGutterAdd              ctermbg=7 guibg=#003742
  highlight GitGutterChange           ctermbg=7 guibg=#003742
  highlight GitGutterDelete           ctermbg=7 guibg=#003742
  highlight GitGutterChangeDelete     ctermbg=7 guibg=#003742
  highlight TabLineSel                ctermbg=4 ctermfg=15
elseif &bg ==# 'dark'
  highlight SignColumn                ctermbg=0 ctermfg=10 guibg=#003742
  highlight CursorLineNr              ctermbg=0 ctermfg=10 guibg=#003742
  highlight VertSplit                 ctermbg=0 guibg=#003742
  highlight GitGutterAdd              ctermbg=0 guibg=#003742
  highlight GitGutterChange           ctermbg=0 guibg=#003742
  highlight GitGutterDelete           ctermbg=0 guibg=#003742
  highlight GitGutterChangeDelete     ctermbg=0 guibg=#003742
  highlight TabLineSel                ctermbg=2 ctermfg=0
endif

highlight clear TabLine
highlight clear TabLineFill

" listchar
highlight SpecialKey ctermbg=none cterm=none
