" Autogroups
" ==========


augroup vimrc_autocmds
  " Remove trailing whitespace on write.
  autocmd BufWritePre * call StripTrailingWhitespace()

  " Highlight the part of the line that goes over 80 characters.
  " (actually the highlight colors are in the theme setups, this is just
  " the match definition)
  autocmd BufRead,BufNewFile * match OverLength /\%81v.\+/
  highlight OverLength ctermbg=5

  " Only show cursorline in the current window.
  autocmd WinLeave * set nocursorline
  autocmd WinEnter * set cursorline
augroup END


augroup trailing
  autocmd!
  autocmd InsertEnter * :set nolist
  autocmd InsertLeave * :set list
augroup END


augroup vimrc_filetypes
  autocmd!

  " Set some file types.
  autocmd BufRead,BufNewFile *.md,*.mmd,*.markdown,*.md.erb set filetype=mkd

  " Turn spell-checking on for specific filetypes.
  autocmd FileType gitcommit setlocal spell
  autocmd FileType mkd setlocal spell

  " Markdown specific options.
  autocmd FileType mkd setlocal textwidth=80
  autocmd FileType mkd setlocal shiftwidth=4
  autocmd FileType mkd setlocal tabstop=4
  autocmd FileType mkd setlocal softtabstop=4
augroup END
