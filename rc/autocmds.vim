" Autogroups
" ==========


augroup vimrc_autocmds
  autocmd!

  " Remove trailing whitespace on write.
  autocmd BufWritePre * :%s/\s\+$//e

  " Only show cursorline in the current window.
  autocmd WinLeave * set nocursorline
  autocmd WinEnter * set cursorline

  " Set some file types.
  autocmd BufRead,BufNewFile *.md set filetype=mkd
  autocmd BufRead,BufNewFile *.mmd set filetype=mkd
  autocmd BufRead,BufNewFile *.markdown set filetype=mkd

  " Turn spell-checking on for specific filetypes.
  autocmd FileType gitcommit setlocal spell
  autocmd FileType mkd setlocal spell

  " Markdown specific options.
  " Wrap text at the when using markdown.
  autocmd FileType mkd setlocal textwidth=80
  autocmd FileType mkd setlocal shiftwidth=4
  autocmd FileType mkd setlocal tabstop=4
  autocmd FileType mkd setlocal softtabstop=4

  " PHP files are HTML files too.
  autocmd BufRead,BufNewFile *.php set filetype=php.html
augroup END
