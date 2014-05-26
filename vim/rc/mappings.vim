" Remappings
" ==========

" Mappings which compensate the fact that I can't type.
" Disable Ex mode. Please.
map Q <nop>


" Keys

" Come on, let's behave.
nnoremap j gj
nnoremap k gk

" 'D' to delete to the end of the line (by default, 'D' just does a 'dd').
" This also catches up with 'C', which changes to the end of the line.
nnoremap D d$

" H and L in order to move to the beginning/ending of the current line.
nnoremap H ^
nnoremap L $

" Keep search matches in the middle of the screen.
nnoremap n nzz
nnoremap N Nzz

" Exit from insert mode by typing 'jj'.
inoremap jj <Esc>

" Dispatch is so useful! (other mappings in leader-mappings.vim)
nnoremap d<CR> :Dispatch<CR>

" Splitjoin mappings: gj to split a line and gk to join it (mnemonics: j goes
" down, k goes up).
nnoremap gj :SplitjoinSplit<CR>
nnoremap gk :SplitjoinJoin<CR>


" Ctrl-keys

" Ctrl-a and Ctrl-e in order to move to the bol/eol in insert mode (shell like).
inoremap <C-a> <C-o>I
inoremap <C-e> <C-o>A

" Ctrl-s to save and return to normal mode if previously in insert mode.
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>

" Move through splits easily using C-h/j/k/l.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Ctrl-u in insert mode to uppercase the word before the cursor.
" (thanks to Steve Losh)
inoremap <C-u> <Esc>gUiwea

" Toggle CtrlP in MRU mode using Ctrl-n.
nnoremap <C-n> :CtrlPMRU<CR>


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


" Fn-keys

" Toggle NERDTree.
nnoremap <F2> :NERDTreeTabsToggle<CR>
