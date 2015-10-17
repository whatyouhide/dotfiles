augroup custom_misc
  autocmd!

  " Only show cursorline in the current window.
  autocmd WinLeave * set nocursorline
  autocmd WinEnter * set cursorline

  " Show trailing spaces, tabs and so on only out of insert mode.
  autocmd InsertEnter * set nolist
  autocmd InsertLeave * set list

  " Super fast exiting from insert mode. Note that with this, you can't possibly
  " use mappings that start with <esc> *in insert mode*, since vim won't wait
  " for you to press other keys.
  autocmd InsertEnter * set timeoutlen=0
  autocmd InsertLeave * set timeoutlen=800

  autocmd User EnterMixProject set wildignore+=*/deps,*/_build
augroup END

" Tweak the colorscheme with custom changes (if present) whenever the
" colorscheme/background changes.
augroup colorschemes
  autocmd!
  au ColorScheme * call TweakColorscheme()
augroup END

augroup filetypes
  autocmd!

  " Set some file types.
  autocmd BufRead,BufNewFile *.md,*.mmd,*.markdown,*.md.erb set filetype=markdown

  autocmd BufRead,BufNewFile *gitconfig set filetype=gitconfig
  autocmd BufRead,BufNewFile *gitconfig_* set filetype=gitconfig

  " Turn spell-checking on for git commits.
  autocmd FileType gitcommit setlocal spell
augroup END
