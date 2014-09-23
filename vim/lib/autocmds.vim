augroup vimrc_autocmds
  autocmd!

  " Only show cursorline in the current window.
  autocmd WinLeave * set nocursorline
  autocmd WinEnter * set cursorline

  " Relative line numbers in normal mode, regular in insert mode.
  au InsertEnter * set norelativenumber
  au InsertLeave * set relativenumber

  " Show trailing spaces, tabs and so on only out of insert mode.
  autocmd InsertEnter * :set nolist
  autocmd InsertLeave * :set list

  " Tweak the colorscheme with custom changes (if present) whenever the
  " colorscheme/background changes.
  au ColorScheme * call TweakColorscheme()
augroup END


augroup filetypes
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
