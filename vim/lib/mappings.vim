" Remappings
" ==========

" Mappings which compensate the fact that I can't type.
" Disable ex mode.
map Q <nop>
" Disable looking stuff up in the man pages.
map K <nop>


" Keys

" Come on, let's behave.
nnoremap j gj
nnoremap k gk

" 'D' to delete to the end of the line (by default, 'D' just does a 'dd').
" This also catches up with 'C', which changes to the end of the line.
" Also, do the exact same thing with 'Y'.
nnoremap D d$
nnoremap Y y$

" H and L in order to move to the beginning/ending of the current line.
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" Keep search matches in the middle of the screen.
nnoremap n nzz
nnoremap N Nzz

" Dispatch is so useful! (other mappings in leader-mappings.vim)
nnoremap d<CR> :Dispatch<CR>

" GitGutter stuff (similar to what unimpaired.vim does).
nnoremap [h :GitGutterPrevHunk<CR>
nnoremap ]h :GitGutterNextHunk<CR>


" Ctrl-keys

" Ctrl-s to save and return to normal mode if previously in insert mode.
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>

" Move through splits easily using C-h/j/k/l.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Alt-keys

" Cycle tabs using Alt-h/l.
nnoremap ˙ gT
nnoremap <A-h> gT
nnoremap ¬ gt
nnoremap <A-l> gt

" Move plugin: move lines or blocks of text up/down using Alt+j/k.
nmap ∆ <Plug>MoveLineDown
nmap <A-j> <Plug>MoveLineDown
nmap ˚ <Plug>MoveLineUp
nmap <A-k> <Plug>MoveLineUp
vmap ∆ <Plug>MoveBlockDown
vmap <A-j> <Plug>MoveBlockDown
vmap ˚ <Plug>MoveBlockUp
vmap <A-k> <Plug>MoveBlockUp
