" Autogroups
" ==========


augroup vimrc_autocmds
  " Remove trailing whitespace on write.
  autocmd BufWritePre * :%s/\s\+$//e

  " Highlight the part of the line that goes over 80 characters.
  " (actually the highlight colors are in the theme setups, this is just
  " the match definition)
  autocmd BufRead,BufNewFile * match OverLength /\%81v.\+/

  " Only show cursorline in the current window.
  autocmd WinLeave * set nocursorline
  autocmd WinEnter * set cursorline
augroup END


augroup vimrc_filetypes
  autocmd!

  " Set some file types.
  autocmd BufRead,BufNewFile *.md set filetype=mkd
  autocmd BufRead,BufNewFile *.mmd set filetype=mkd
  autocmd BufRead,BufNewFile *.markdown set filetype=mkd
  " The sshconfig filetype is just for ~/.ssh/config, but I have that file in my
  " dotfiles.
  autocmd BufRead,BufEnter ~/dotfiles/ssh/config set filetype=sshconfig

  " Turn spell-checking on for specific filetypes.
  autocmd FileType gitcommit setlocal spell
  autocmd FileType mkd setlocal spell

  " Markdown specific options.
  autocmd FileType mkd setlocal textwidth=80
  autocmd FileType mkd setlocal shiftwidth=4
  autocmd FileType mkd setlocal tabstop=4
  autocmd FileType mkd setlocal softtabstop=4

  " PHP files are HTML files too.
  autocmd BufRead,BufNewFile *.php set filetype=php.html
augroup END
