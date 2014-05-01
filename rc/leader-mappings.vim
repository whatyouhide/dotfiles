" <Leader> mappings
" =================

" These are mappings involving the <Leader> key.


" vr: reload vimrc (and reload fucking Airline for right colors).
nmap <Leader>vr :source ~/.vimrc<CR>:AirlineRefresh<CR>
" ve: open vimrc in a new tab.
nmap <Leader>ve :tabedit ~/.vimrc<CR>
" vi and vc: install/clean bundles after reloading.
nmap <Leader>vi :source ~/.vimrc<CR>:BundleInstall<CR>
nmap <Leader>vc :source ~/.vimrc<CR>:BundleClean<CR>


" fr: rename current file (function rename-file).
nnoremap <Leader>fr :call RenameCurrentFile()<CR>


" csl and csd: change colorscheme to a light/dark theme.
nnoremap <Leader>csl :so ~/.vim/rc/theme-setups/solarized.vim<CR>:AirlineRefresh<CR>
nnoremap <Leader>csd :so ~/.vim/rc/theme-setups/railscasts.vim<CR>:AirlineRefresh<CR>
" bl and bd: set background to light/dark.
nnoremap <Leader>bl :set bg=light<CR>
nnoremap <Leader>bd :set bg=dark<CR>


" sc: run the current spec.
nnoremap <Leader>s :call RunCurrentSpecFile()<CR>
" sa: run all the specs.
nnoremap <Leader>rsp :call RunAllSpecs()<CR>


" Exploring directories (NERDTree/netrw agnostic).
" .: explore the cwd in the current split.
nnoremap <Leader>. :edit .<CR>


" Rails.vim.
" a: use the rails.vim ':A' command.
nnoremap <Leader>a :A<CR>
" r: use the rails.vim ':j' command.
nnoremap <Leader>r :R<CR>


" p: go to the previously open file.
nnoremap <Leader>p <C-^>


" m: distraction free mode (using Goyo).
nnoremap <Leader>m :Goyo<CR>


" chr: reload Chrome Canary (on a Mac). Relies on a script inside $DOTFILES/bin.
nnoremap <Leader>chr :echomsg system('chrome-canary-refresh')<CR>


" g: execute the current file in the previous tmux pane.
nnoremap <Leader>g :Rant<CR>


" h: clear the search highlighting.
nnoremap <silent> <Leader>/ :<C-u>nohlsearch<CR><C-l>
