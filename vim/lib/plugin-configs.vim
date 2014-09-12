" Plugins configurations
" ======================


" Goyo
let g:goyo_margin_top = 1
let g:goyo_margin_bottom = 1
let g:goyo_width = 85

function! g:goyo_before()
  exec ':NERDTreeClose'
endfunction

let g:goyo_callbacks = [function('g:goyo_before'), function('ColorschemeBasedOnTime')]


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


" NERDTree
let NERDTreeIgnore = ['\.DS_Store$', '\.git$', '\.sass-cache$']
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1

" vim-nerdtree-tabs
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_console_startup = 0


" Ultisnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsSnippetDirectories=["ulti-snippets"]


" CtrlP
let g:ctrlp_custom_ignore = '\v[\/](\.DS_Store|\.git|node_modules|\.sass-cache|tmp)$'
let g:ctrlp_dont_split = 'nerdtree'
let g:ctrlp_max_height = 25
let g:ctrlp_show_hidden = 1


" GitGutter
" Make the sign column always visible.
let g:gitgutter_sign_column_always = 1


" Gist.vim
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1


" Syntastic
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }
let g:syntastic_error_symbol = '☢'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_warning_symbol = '☛'
let g:syntastic_style_warning_symbol = '⚑'

let g:syntastic_ruby_checkers = ['mri', 'rubocop']


" Stripper
let g:StripperIgnoreFileTypes = ['mkd', 'liquid']
