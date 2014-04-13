" Remappings
" ==========


" Use hjkl.
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk


" One less keystroke *every time*.
nnoremap ; :


" Disable Ex mode. Please.
map Q <nop>


" Ctrl-s to save and return to normal mode if previously in insert mode.
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>


" Exit from insert mode by typing 'jj'.
inoremap jj <Esc>


" Move through splits easily using arrows.
nnoremap <left> <C-w>h
nnoremap <down> <C-w>j
nnoremap <up> <C-w>k
nnoremap <right> <C-w>l


" Cycle tabs using Ctrl-h/l.
nnoremap <C-h> gT
nnoremap <C-l> gt


" Insert a blank line below the current one using Alt-o.
nmap ø :set paste<CR>o<Esc>:set nopaste<CR>
nmap <A-o> :set paste<CR>o<Esc>:set nopaste<CR>


" Move plugin: move lines or blocks of text up/down using Alt+j/k.
" Note that on a Mac these map to Unicode charactes, so use these:
" ∆: Alt+j, ˚: Alt+k
nmap ∆ <Plug>MoveLineDown
nmap <A-j> <Plug>MoveLineDown
nmap ˚ <Plug>MoveLineUp
nmap <A-k> <Plug>MoveLineUp
vmap ∆ <Plug>MoveBlockDown
vmap <A-j> <Plug>MoveBlockDown
vmap ˚ <Plug>MoveBlockUp
vmap <A-k> <Plug>MoveBlockUp


" <Leader>v shortcuts: they are dedicated to vim stuff.
" vr: reload vimrc.
nmap <Leader>vr :source ~/.vimrc<CR>
" ve: open vimrc in a new tab.
nmap <Leader>ve :tabedit ~/.vimrc<CR>
" vbi and vbc: install/clean bundles after reloading.
nmap <Leader>vbi :source ~/.vimrc<CR>:BundleInstall<CR>
nmap <Leader>vbc :source ~/.vimrc<CR>:BundleClean<CR>


" <Leader>n shortcuts: they're for NERDTree.
" nt: toggle NERDTree.
nnoremap <Leader>nt :NERDTreeToggle<CR>
" nc: find current file in NERDTree.
nnoremap <Leader>nc :NERDTreeFind<CR>
" nf: make NERDTree the only split in the current tab.
nnoremap <silent> <Leader>nf :NERDTreeFocus<CR>:only<CR>


" <Leader>f shortcuts: custom functions calls.
" fr: rename current file (function rename-file).
nnoremap <Leader>fr :call RenameCurrentFile()<CR>


" <Leader>r shortcuts: running stuff.
" rn: execute the current file in the next tmux pane.
nnoremap <Leader>rn :call ExecuteCurrentFileInNextTmuxPane()<CR>
" rp: execute the current file in the previous tmux pane.
nnoremap <Leader>rp :call ExecuteCurrentFileInPreviousTmuxPane()<CR>


" Miscellaneous <Leader> shortcuts.
" m: distraction free mode (using Goyo).
nnoremap <Leader>m :Goyo<CR>
" cr: reload Chrome Canary (on a Mac). Relies on a script inside $DOTFILES/bin.
nnoremap <Leader>cr :echomsg system('chrome-canary-refresh')<CR>
