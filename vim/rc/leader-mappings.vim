" <Leader> mappings
" =================

" These are mappings involving the <Leader> key.

" Change the leader key.
" This is a workaround (instead of using `let mapleader = ' '`), which does not
" shoe 'showcmd' on the command line.
let leadermap = "\\"
map <Space> <Leader>

" vi: install bundles after reloading.
nmap <Leader>vi :source ~/.vimrc<CR>:PluginInstall<CR>
" vr: reload vimrc (and reload fucking Airline for right colors).
nmap <Leader>vr :source ~/.vimrc<CR>:AirlineRefresh<CR>
" ve: open vimrc in a new tab.
nmap <Leader>ve :tabedit ~/.vimrc<CR>

" csl and csd: change colorscheme to a light/dark theme.
nnoremap <Leader>csl :so ~/.vim/rc/theme-setups/solarized.vim<CR>:AirlineRefresh<CR>
nnoremap <Leader>csd :so ~/.vim/rc/theme-setups/railscasts.vim<CR>:AirlineRefresh<CR>

" s: run the current spec.
nnoremap <Leader>s :call RunCurrentSpecFile()<CR>

" .: explore the cwd in the current split.
nnoremap <Leader>. :edit .<CR>

" a: use the rails.vim ':A' command.
nnoremap <Leader>a :A<CR>

" p: go to the previously open file.
nnoremap <Leader>p <C-^>

" m: distraction free mode (using Goyo).
nnoremap <Leader>m :Goyo<CR>

" gs: git status (via fugitive).
nnoremap <Leader>gs :Gstatus<CR>:resize 25<CR>

" /: clear the search highlighting.
nnoremap <silent> <Leader>/ :<C-u>nohlsearch<CR><C-l>

" d and D: Dispatch.vim stuff.
nnoremap <Leader>d :Dispatch
nnoremap <Leader>D :Dispatch!
