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


" Change the program which will run the current buffer with ',r'.
function! ChangeRunner()
  let b:execute_with = input('Program to execute the current file: ')
endfunction


" Change the tmux pane where files will be executed with ',r'.
function! ChangeTmuxPaneForFileExecution()
  let pane = input('Index of the pane where files will be executed: ')
  let g:tmux_pane_for_running_files = pane
endfunction


" Execute the current file in the designated tmux pane.
" That pane is asked to the user the first time, and stored for subsequent
" use. You can manually change it through the 'ChangeTmuxPaneForFileExecution'
" function.
function! ExecuteCurrentFileInTmuxPane()
  " If there isn't a program to run the current file, ask the user.
  " The user always knows what to do.
  if !exists('b:execute_with')
    call ChangeRunner()
  endif

  " Define command (as in command line) that runs the current file.
  let command = b:execute_with . " " . expand('%')

  " Prompt for the pane to use if it wasn't already set.
  if !exists('g:tmux_pane_for_running_files')
    call ChangeTmuxPaneForFileExecution()
  endif

  " Build the final command.
  let prefix = 'tmux send-keys -t ' . g:tmux_pane_for_running_files
  let tmux_cmd = prefix . ' "' . command . '" C-m'

  " Execute the final command.
  execute ":echomsg system('" . tmux_cmd . "')"
endfunction
