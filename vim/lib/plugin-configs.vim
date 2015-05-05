" Plugins configurations
" ======================


" Goyo
let g:goyo_margin_top = 1
let g:goyo_margin_bottom = 1
let g:goyo_width = 85

function! GoyoEnter()
  set norelativenumber nonumber

  if has('gui_running') | set fullscreen | endif

  if exists('$TMUX')
    silent !tmux set status off
  endif
endfunction

function! GoyoLeave()
  set relativenumber number

  if exists('$TMUX')
    silent !tmux set status on
  endif
endfunction

let g:goyo_callbacks = [function('GoyoEnter'), function('GoyoLeave')]


" Airline
" Always show Airline and use powerline fonts.
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#close_symbol = '×'


" Move
" Remove default mappings.
let g:move_map_keys = 0


" TComment
" Don't comment blank lines.
let g:tcomment#blank_lines = 0


" Ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetDirectories = ['ulti-snippets']
let g:UltiSnipsSnippetsDir = '~/.vim/'. g:UltiSnipsSnippetDirectories[0]


" CtrlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:6,max:6'
let g:ctrlp_tabpage_position = 'l' " (last)
let g:ctrlp_custom_ignore =
      \ '\v[\/](\.DS_Store|\.git|node_modules|\.sass-cache|tmp)$'


" Vimux
let g:VimuxHeight = "30"


" GitGutter
" Make the sign column always visible when enabled.
let g:gitgutter_sign_column_always = 1
let g:gitgutter_enabled = 0


" Gist.vim
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1


" vim-markdown
let g:vim_markdown_folding_disabled = 1


" Syntastic
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }
let g:syntastic_error_symbol = '☢'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_warning_symbol = '☛'
let g:syntastic_style_warning_symbol = '⚑'


" vim-airline
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'n',
      \ 'i'  : 'i',
      \ 'R'  : 'r',
      \ 'c'  : 'c',
      \ 'v'  : 'v',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 's',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }
let g:airline_section_y = airline#section#create(['%L'])



" Stripper
let g:StripperIgnoreFileTypes = ['mkd', 'liquid']


" vim-lengthmatters
let g:lengthmatters_excluded = [
      \   'unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m',
      \   'nerdtree', 'help', 'qf', 'Dockerfile'
      \ ]


" Latex-Box.
let g:tex_flavor = 'latex'
let g:LatexBox_latexmk_async = 0
let g:LatexBox_viewer = 'open -a Skim'
let g:LatexBox_latexmk_preview_continuously = 1
let g:LatexBox_quickfix = 2
let g:LatexBox_show_warnings = 1
let g:LatexBox_Folding = 1
let g:LatexBox_latexmk_options = '--shell-escape'


" vim-go
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
