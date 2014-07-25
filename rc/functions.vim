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
" It takes two optional parameters: the start and end hours for the light
" colorscheme to be used.
function! ColorschemeBasedOnTime()
  let l:current_hour = strftime("%H")

  if l:current_hour > g:light_colorscheme_starts_at && l:current_hour < g:light_colorscheme_ends_at
    call SourceThemeSetup(g:light_colorscheme)
  else
    call SourceThemeSetup(g:dark_colorscheme)
  endif
endfunction

" GUI vim behaves differenlty since all the colorschemes look fine and no
" further setup is needed. So just source a colorscheme if present in the
" environment and set its background based on the time of the day.
" *Note* that this function is only called in gvimrc.
function! GuiColorschemeBasedOnTime()
  " Change the colorscheme only if there's a GUI specific colorscheme. Note that
  " in `vim/vimrc`, I check for the existence of this variable again: if it
  " doesn't exists, the colorscheme rules applied to console vim apply to GUI
  " vim too.
  if !empty('$DOTFILES_GUI_VIM_COLORSCHEME')
    colorscheme $DOTFILES_GUI_VIM_COLORSCHEME
  end

  let l:current_hour = strftime("%H")
  if l:current_hour > g:light_colorscheme_starts_at && l:current_hour < g:light_colorscheme_ends_at
    set background=light
  else
    set background=dark
  endif
endfunction
