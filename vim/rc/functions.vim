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


" Source the dark/light colorscheme based on the time of the day.
" It takes two optional parameters: the start and end hours for the light
" colorscheme to be used.
function! ColorschemeBasedOnTime(...)
  let l:start = 9
  let l:end = 19

  if a:0 > 0
    let l:start = a:1
    let l:end = a:2
  endif

  let l:current_hour = strftime("%H")
  if l:current_hour > l:start && l:current_hour < l:end
    call SourceThemeSetup(g:light_colorscheme)
  else
    call SourceThemeSetup(g:dark_colorscheme)
  endif
endfunction
