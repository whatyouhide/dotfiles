" Commands
" ========

" Rename and remove files.
command! Rename call RenameCurrentFile()
command! Remove call delete(expand('%')) | bdelete!

" Open a markdown file in Marked 2.app (only on OSX).
if has('unix') && system('uname -s') == "Darwin\n"
  command! Marked silent exec "!open -a 'Marked 2' %"
endif
