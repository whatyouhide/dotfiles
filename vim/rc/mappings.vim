" Remappings
" ==========


" Change the leader from '\' to ','.
let mapleader=","


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


" Toggle CtrlP in MRU mode using Ctrl-n.
nnoremap <C-n> :CtrlPMRU<CR>


" Searching with sane regexps.
" nnoremap / /\v
" Clearing the highlight of the search results with Ctrl-l (which by default
" redraws the screen).
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>



" <Leader>v shortcuts: they are dedicated to vim stuff.
" vr: reload vimrc (and reload fucking Airline for right colors).
nmap <Leader>vr :source ~/.vimrc<CR>:AirlineRefresh<CR>
" ve: open vimrc in a new tab.
nmap <Leader>ve :tabedit ~/.vimrc<CR>
" vbi and vbc: install/clean bundles after reloading.
nmap <Leader>vbi :source ~/.vimrc<CR>:BundleInstall<CR>
nmap <Leader>vbc :source ~/.vimrc<CR>:BundleClean<CR>


" <Leader>f shortcuts: custom functions calls.
" fr: rename current file (function rename-file).
nnoremap <Leader>fr :call RenameCurrentFile()<CR>


" <Leader>csl: change colorscheme to a light theme.
" <Leader>csd: change colorscheme to a dark theme.
nnoremap <Leader>csl :so ~/.vim/rc/theme-setups/solarized.vim<CR>:AirlineRefresh<CR>
nnoremap <Leader>csd :so ~/.vim/rc/theme-setups/railscasts.vim<CR>:AirlineRefresh<CR>


" <Leader>s: specs.
" sc: run the current spec.
nnoremap <Leader>sc :call RunCurrentSpecFile()<CR>
" sa: run all the specs.
nnoremap <Leader>sa :call RunAllSpecs()<CR>


" Exploring directories (NERDTree/netrw agnostic).
" .: explore the cwd inside the current split.
" e: explore the cwd in a vertical split.
nnoremap <Leader>. :edit .<CR>
nnoremap <Leader>e :vsplit .<CR>


" Miscellaneous <Leader> shortcuts.
" m: distraction free mode (using Goyo).
nnoremap <Leader>m :Goyo<CR>
" cr: reload Chrome Canary (on a Mac). Relies on a script inside $DOTFILES/bin.
nnoremap <Leader>cr :echomsg system('chrome-canary-refresh')<CR>
" g: execute the current file in the previous tmux pane.
nnoremap <Leader>g :Rant<CR>
