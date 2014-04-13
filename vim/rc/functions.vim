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


function! ChangeTmuxPaneForFileExecution()
  let pane = input('Index of the pane where files will be executed: ')
  let g:tmux_pane_for_running_files = pane
endfunction


function! ExecuteCurrentFileInTmuxPane()
  " If there isn't a program to run the current file, exit gracefully.
  if !exists('g:execute_with')
    let g:execute_with = input('Program to execute the current file: ')
  endif

  " Define command (as in command line) that runs the current file.
  let command = g:execute_with . " " . expand('%')

  " Prompt for the pane to use if it wasn't already set.
  if !exists('g:tmux_pane_for_running_files')
    call ChangeTmuxPaneForFileExecution()
  endif

  let prefix = 'tmux send-keys -t ' . g:tmux_pane_for_running_files
  let tmux_cmd = prefix . ' "' . command . '" C-m'

  exec ":echomsg system('" . tmux_cmd . "')"
endfunction
