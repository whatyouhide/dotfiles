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


" Source a theme setup from `dotfiles/vim/rc/theme-setups`.
function! SourceThemeSetup(theme)
  exec ':source ~/dotfiles/vim/rc/theme-setups/' . a:theme . '.vim'

  " Refresh Airline if in a script.
  if exists(':AirlineRefresh')
    exec ':AirlineRefresh'
  endif
endfunction


" Source the dark/light colorscheme based on the time of the day.
" If the vim instance is a GUI vim, then source the colorscheme in
" g:gui_colorscheme and set the background appropriately, while if it's console
" vim source the custom theme setup.
" This is done since GUI vim don't screw up themes like console vim (at least
" with iTerm themes) does.
function! ColorschemeBasedOnTime()
  " Check if it's day or night.
  let l:is_day = strftime("%H") > g:day_starts_at && strftime("%H") < g:day_ends_at

  " Set colorscheme and background if this is a GUI vim and the
  " g:gui_colorscheme variable isn't empty (if it is, just fall back to the
  " console themes).
  if has('gui_running') && !empty('g:gui_colorscheme')
    if l:is_day | set bg=light | else | set bg=dark | endif
    exec 'colorscheme ' . g:gui_colorscheme
    return
  endif

  " Setup the console vim (this function would have returned if GUI vim was
  " active).
  if l:is_day
    call SourceThemeSetup(g:light_colorscheme)
  else
    call SourceThemeSetup(g:dark_colorscheme)
  endif
endfunction
