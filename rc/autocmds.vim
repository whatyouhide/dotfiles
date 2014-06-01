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

  " eruby should get the benefits of being HTML too sometimes.
  " Setting the syntax to eruby is a little hack that allows rails.vim to
  " highlight Rails stuff.
  autocmd BufRead,BufNewFile *.html.erb set filetype=eruby.html | set syn=eruby
augroup END
