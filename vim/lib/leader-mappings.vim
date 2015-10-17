" These are mappings involving the <Leader> key.


" This is a workaround (instead of using `let mapleader = ' '`); the latter
" doesn't show 'showcmd' on the command line.
let mapleader = ' '
map <Space> <Leader>

" Local leader (mainly used by LaTeX plugins like Latex-Box, still useful).
let maplocalleader = '\'

" g<...>: git (fugitive, GitGutter).
nnoremap <Leader>gs :Gstatus<CR>:resize 25<CR>
noremap  <Leader>gb :Gbrowse<CR>
noremap  <Leader>gB :Gbrowse!<CR>
nnoremap <Leader>gg :GitGutterToggle<CR>
nnoremap <Leader>ga :GitGutterStageHunk<CR>

" t<...>: Vimux.
nnoremap <Leader>tc :call VimuxCloseRunner()<CR>
nnoremap <Leader>ti :call VimuxInspectRunner()<CR>
nnoremap <Leader>tz :call VimuxZoomRunner()<CR>
nnoremap <Leader>tp :call VimuxPromptCommand()<CR>
nnoremap <Leader>tt :call VimuxRunTestCommand()<CR>
nnoremap <Leader>trr :w<CR>:call VimuxRunLastCommand()<CR>
nnoremap <Leader>tcd :call VimuxRunCommand('cd ' . getcwd())<CR>

" m<...>: Mix.
nnoremap <Leader>mt :Mix test %<CR>

" Toggle search highlighting.
nnoremap <Leader>/ :set hlsearch!<CR>

" p: go to the previously open file.
nnoremap <Leader>p <C-^>

" df: distraction free mode (using Goyo).
nnoremap <Leader>df :Goyo<CR>

" it: set spelllang to italian.
nnoremap <Leader>it :set spelllang=it<CR>

" cob: toggle between the custom light and dark backgrounds.
nnoremap <Leader>cob :call ToggleLightAndDarkColorschemes()<CR>
