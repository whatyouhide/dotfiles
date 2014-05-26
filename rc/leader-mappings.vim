" <Leader> mappings
" =================

" These are mappings involving the <Leader> key.

" This is a workaround (instead of using `let mapleader = ' '`), which does not
" shoe 'showcmd' on the command line.
map <Space> <Leader>


" vi[nstall-plugins], vr[reload], ve[dit-vimrc].
nmap <Leader>vi :source ~/.vimrc<CR>:PluginInstall<CR>
nmap <Leader>vr :source ~/.vimrc<CR>:AirlineRefresh<CR>
nmap <Leader>ve :tabedit ~/.vimrc<CR>

" Toggle search highlighting.
nnoremap <Leader>/ :set hlsearch!<CR>

" s: run the current spec.
nnoremap <Leader>s :call RunCurrentSpecFile()<CR>

" ra, rr: use the rails.vim ':AV'/':RV' commands.
nnoremap <Leader>ra :AV<CR>
nnoremap <Leader>rr :RV<CR>

" p: go to the previously open file.
nnoremap <Leader>p <C-^>

" m: distraction free mode (using Goyo).
nnoremap <Leader>m :Goyo<CR>

" gs: git status (via fugitive).
nnoremap <Leader>gs :Gstatus<CR>:resize 25<CR>

" d and D: Dispatch.vim stuff.
nnoremap <Leader>d :Dispatch
nnoremap <Leader>D :Dispatch!
