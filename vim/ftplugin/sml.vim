" The vast majority of these stuff is achieved through the Vimux plugin, see
" ':help vimux'.

" Send the selection to a REPL.
vnoremap <leader>r :call VimuxSlime(';\n')<cr>


" Run the current file.
function! s:RunCurrentFile()
  let name = bufname('%')
  call VimuxCloseRunner()
  call VimuxRunCommand('clear; sml ' . name)
endfunction

" Run the test for the current file (same name, with a '_test' suffix).
function! s:RunTestFile()
  let extension = expand('%:e')
  let filename = expand('%:r')

  let test_file = filename . '_test.' . extension

  call VimuxCloseRunner()
  call VimuxRunCommand('clear; sml ' . test_file)
endfunction

noremap <leader>tr :call <SID>RunCurrentFile()<cr>
noremap <leader>tt :call <SID>RunTestFile()<cr>
