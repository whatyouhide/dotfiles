" Functions
" =========

" (NOTE: some functions in this file are mapped. This mappings are located
" inside vim/rc/mappings.vim.


" Rename the current file.
function! RenameCurrentFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')

  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction


" Run the current file in the tmux pane identified by `pane`.
" Note that there are no existence checks, it assumes everything is in its
" place.
function! ExecuteCurrentFileInTmuxPane(pane)
  let command = g:execute_with . " " . expand("%")
  let tmux_command = 'tmux send-keys -t ' . a:pane . ' "' . command . '" C-m'
  exec ":echomsg system('" . tmux_command . "')"
endfunction

" Run the current file inside the pane with the index next to the current one.
" See ExecuteCurrentFileInTmuxPane() for further details.
function! ExecuteCurrentFileInPreviousTmuxPane()
  " Find current tmux pane.
  let current_pane = system('tmux list-panes | grep active | cut -d : -f 1')
  call ExecuteCurrentFileInTmuxPane(current_pane - 1)
endfunction

" Run the current file in the pane with the index previous to the current one.
" See ExecuteCurrentFileInTmuxPane() for further details.
function! ExecuteCurrentFileInNextTmuxPane()
  " Find current tmux pane.
  let current_pane = system('tmux list-panes | grep active | cut -d : -f 1')
  call ExecuteCurrentFileInTmuxPane(current_pane + 1)
endfunction
