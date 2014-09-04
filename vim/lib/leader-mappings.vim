" <Leader> mappings
" =================

" These are mappings involving the <Leader> key.

" This is a workaround (instead of using `let mapleader = ' '`); the latter
" doesn't show 'showcmd' on the command line.
map <Space> <Leader>


" vi[nstall-plugins], vr[reload], ve[dit-vimrc].
nmap <Leader>vr :source ~/.vimrc<CR>:AirlineRefresh<CR>
nmap <Leader>ve :tabedit ~/.vimrc<CR>

" Toggle search highlighting.
nnoremap <Leader>/ :set hlsearch!<CR>

" p: go to the previously open file.
nnoremap <Leader>p <C-^>

" m: distraction free mode (using Goyo).
nnoremap <Leader>m :Goyo<CR>

" gs: git status (via fugitive).
nnoremap <Leader>gs :Gstatus<CR>:resize 25<CR>

" d and D: Dispatch.vim stuff.
nnoremap <Leader>d :Dispatch<Space>
nnoremap <Leader>D :Dispatch!<Space>

" it: set spelllang to italian.
nnoremap <Leader>it :set spelllang=it<CR>

" csl and csd: change colorscheme (light/dark).
nnoremap <Leader>csl :call SetThemeTo(g:light_colorscheme, 'light')<CR>
nnoremap <Leader>csd :call SetThemeTo(g:dark_colorscheme, 'dark')<CR>

" s: check with syntastic.
nnoremap <Leader>s :SyntasticCheck<CR>

" cr: reload the currently active Chrome tab.
nnoremap <Leader>cr :call system('chrome-refresh')<CR>:echo 'Refreshing Chrome...'<CR>
