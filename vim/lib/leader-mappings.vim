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

" g<...>: Gstatus.
nnoremap <Leader>gs :Gstatus<CR>:resize 25<CR>
nnoremap <Leader>gP :Gpush<CR>

" t<...>: Vimux.
nnoremap <Leader>tq :VimuxCloseRunner<CR>
nnoremap <Leader>ti :VimuxInspectRunner<CR>
nnoremap <Leader>tz :VimuxZoomRunner<CR>
nnoremap <Leader>td :call VimuxSendKeys('C-d')<CR>
nnoremap <Leader>tp :call VimuxPromptCommand()<CR>
nnoremap <Leader>trr :w<CR>:call VimuxRunLastCommand()<CR>

" Toggle search highlighting.
nnoremap <Leader>/ :set hlsearch!<CR>

" p: go to the previously open file.
nnoremap <Leader>p <C-^>

" m: distraction free mode (using Goyo).
nnoremap <Leader>m :Goyo<CR>

" it: set spelllang to italian.
nnoremap <Leader>it :set spelllang=it<CR>

" s: check with syntastic.
nnoremap <Leader>s :SyntasticCheck<CR>
