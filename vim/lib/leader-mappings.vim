" These are mappings involving the <Leader> key.


" This is a workaround (instead of using `let mapleader = ' '`); the latter
" doesn't show 'showcmd' on the command line.
let mapleader = ' '
map <Space> <Leader>

" Local leader (mainly used by LaTeX plugins like Latex-Box, still useful).
let maplocalleader = '\'


" v<...>: vim stuff.
nmap <Leader>vr :source ~/.vimrc<CR>:AirlineRefresh<CR>
nmap <Leader>ve :tabedit ~/.vimrc<CR>
nmap <Leader>vp :tabedit ~/.vim/lib/plugins.vim<CR>

" g<...>: fugitive.
nnoremap <Leader>gs :Gstatus<CR>:resize 25<CR>
nnoremap <Leader>gP :Gpush<CR>

" t<...>: Vimux.
nnoremap <Leader>tc :call VimuxCloseRunner()<CR>
nnoremap <Leader>ti :call VimuxInspectRunner()<CR>
nnoremap <Leader>tz :call VimuxZoomRunner()<CR>
nnoremap <Leader>tp :call VimuxPromptCommand()<CR>
nnoremap <Leader>tt :call VimuxRunTestCommand()<CR>
nnoremap <Leader>trr :w<CR>:call VimuxRunLastCommand()<CR>
nnoremap <Leader>tcd :call VimuxRunCommand('cd ' . getcwd())<CR>

" (l?)cd: cd to the current file's directory.
nnoremap <Leader>cd :cd %:p:h<CR>
nnoremap <Leader>lcd :lcd %:p:h<CR>

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

" s: check with syntastic.
nnoremap <Leader>s :SyntasticCheck<CR>

" gg: GitGutter.
nnoremap <Leader>gg :GitGutterToggle<CR>
nnoremap <Leader>ga :GitGutterStageHunk<CR>

" cob: toggle between the custom light and dark backgrounds.
nnoremap <Leader>cob :call ToggleLightAndDarkColorschemes()<CR>
