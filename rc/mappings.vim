" Remappings
" ==========


" Use hjkl.
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk


" Let's remap , since it's the leader key, but we still want to use it when
" searching for characters.
nnoremap \ ,


" Disable Ex mode. Please.
" Use Q to quit current file.
map Q <nop>


" 'D' to delete to the end of the line (by default, 'D' just does a 'dd').
" This also catches up with 'C', which changes to the end of the line.
nnoremap D d$


" H and L in order to move to the beginning/ending of the current line.
nnoremap H ^
nnoremap L $

" Ctrl-a and Ctrl-e in order to move to the bol/eol in insert mode (shell like).
inoremap <C-a> <C-o>I
inoremap <C-e> <C-o>A


" Ctrl-s to save and return to normal mode if previously in insert mode.
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>


" Keep search matches in the middle of the screen.
nnoremap n nzz
nnoremap N Nzz


" Exit from insert mode by typing 'jj'.
inoremap jj <Esc>


" Move through splits easily using C-h/j/k/l.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Cycle tabs using Alt-h/l.
nnoremap ˙ gT
nnoremap <A-h> gT
nnoremap ¬ gt
nnoremap <A-l> gt


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


" Function keys mappings.
" Toggle NERDTree.
nnoremap <F2> :NERDTreeToggle<CR>


" Ctrl-r Ctrl-r to paste the last register inside Insert mode (mnemonic:
" C-r{number} pastes the {number} register).
inoremap <C-r><C-r> <C-r>"


" Ctrl-u in insert mode to uppercase the word before the cursor.
" (thanks to Steve Losh)
inoremap <C-u> <Esc>mzgUiw`za


" Toggle CtrlP in MRU mode using Ctrl-n.
nnoremap <C-n> :CtrlPMRU<CR>
