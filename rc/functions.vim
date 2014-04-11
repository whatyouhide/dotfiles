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

" Run the current file in a split. The program used to run the file is
" determined in an autogroup inside vimrc.
function! ExecuteCurrentFileInSplit()
  let result = system(g:execute_with . " " . expand("%"))
  split __execution_result__
  normal ! ggdG
  setlocal buftype=nofile
  call append(0, split(result, '\v\n'))
endfunction
