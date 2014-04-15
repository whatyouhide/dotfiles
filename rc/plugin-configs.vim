" Plugins configurations
" ======================


" Goyo
let g:goyo_margin_top = 1
let g:goyo_margin_bottom = 1
let g:goyo_width = 85

" Empty function (g:goyo_callbacks needs a 'before' and an 'after' hook).
function! g:goyo_before()
endfunction

" Restore the theme (in case some colors went bad), and refresh Airline.
function! g:goyo_after()
  source ~/.vim/rc/theme-setups/railscasts.vim
  AirlineRefresh
endfunction

let g:goyo_callbacks = [function('g:goyo_before'), function('g:goyo_after')]


" Airline
" Always show Airline.
set laststatus=2


" Move
" Remove default mappings.
let g:move_map_keys = 0


" TComment
" Don't comment blank lines.
let g:tcomment#blank_lines = 0


" Ultisnips
" Expand snippets using <tab>.
let g:UltiSnipsExpandTrigger="<tab>"


" NERDTree
" Close the NERDTree pane when opening a file with 'o' (or Enter).
let NERDTreeQuitOnOpen = 1

" CtrlP
let g:ctrlp_custom_ignore = '\v[\/](\.DS_Store|\.git|node_modules)$'
let g:ctrlp_dont_split = 'nerdtree'
let g:ctrlp_max_height = 25


" GitGutter
" Make the sign column always visible.
let g:gitgutter_sign_column_always = 1


" vim-markdown
" Disable folding and default key mappings.
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1


" Gist.vim
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1
