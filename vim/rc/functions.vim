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

" Strip trailing whitespace except for a bunch of filetypes.
function! StripTrailingWhitespace()
  " Not on these filetypes.
  if &ft =~ 'mkd'
    return
  endif

  %s/\s\+$//e
endfunction

" Source a theme setup.
function! SourceThemeSetup(theme)
  exec ':source ~/dotfiles/vim/rc/theme-setups/' . a:theme . '.vim'

  " Refresh Airline if in a script.
  if exists(':AirlineRefresh')
    exec ':AirlineRefresh'
  endif
endfunction
