" Leader mappings for dealing with plugin installing/updating/cleaning.
function! PluginMappings()
  nnoremap <buffer> <leader>pi :so %<cr> :PlugInstall<cr>
  nnoremap <buffer> <leader>pu :so %<cr> :PlugUpdate<cr>
  nnoremap <buffer> <leader>pc :so %<cr> :PlugClean<cr>
endfunction

au BufRead *plugins.vim* call PluginMappings()


" Ignore some directories when using CtrlP.
let g:ctrlp_custom_ignore = '\v(zsh/\.antigen|vim/bundle)$'

" Set some filetypes based on where these files are stored.
au BufRead,BufNewFile zsh/**/* set ft=zsh
au BufRead,BufNewFile tmux/**/* set ft=tmux-conf
