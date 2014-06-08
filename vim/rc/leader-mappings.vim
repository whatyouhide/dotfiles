" <Leader> mappings
" =================

" These are mappings involving the <Leader> key.

" This is a workaround (instead of using `let mapleader = ' '`), which does not
" show 'showcmd' on the command line.
map <Space> <Leader>


" vi[nstall-plugins], vr[reload], ve[dit-vimrc].
nmap <Leader>vi :source ~/.vimrc<CR>:PluginInstall<CR>
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

" a, r: use the rails.vim ':AV'/':RV' commands.
nnoremap <Leader>a :AV<CR>
nnoremap <Leader>r :RV<CR>

" it: set spelllang to italian.
nnoremap <Leader>it :set spelllang=it<CR>

" csl and csd: change colorscheme (light/dark).
nnoremap <Leader>csl :call SourceThemeSetup(g:light_colorscheme)<CR>
nnoremap <Leader>csd :call SourceThemeSetup(g:dark_colorscheme)<CR>

" wai: where am I? Tell me the path of the current file.
nnoremap <Leader>wai :echo @%<CR>
