" Commands
" ========

command! Rename call RenameCurrentFile()
command! Remove call delete(expand('%')) | bdelete!
