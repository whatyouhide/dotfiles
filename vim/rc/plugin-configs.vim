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


" NERDTree
let NERDTreeIgnore = ['\.DS_Store$']


" Ultisnips
" Expand snippets using <tab>.
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsEditSplit = "vertical"


" CtrlP
let g:ctrlp_custom_ignore = '\v[\/](\.DS_Store|\.git|node_modules|\.sass-cache)$'
let g:ctrlp_dont_split = 'nerdtree'
let g:ctrlp_max_height = 25
let g:ctrlp_show_hidden = 1


" GitGutter
" Make the sign column always visible.
let g:gitgutter_sign_column_always = 1


" Gist.vim
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1


" vim-rspec
let g:rspec_runner = "os_x_iterm"


" Emmet
let g:user_emmet_leader_key = '<C-z>'
