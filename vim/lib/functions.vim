" Functions
" =========

" (NOTE: some functions in this file are mapped. This mappings are located
" inside vim/rc/mappings.vim.


" Check if a file exists.
function! FileExists(path)
  return !empty(glob(a:path))
endfunction


" Source a theme setup from `dotfiles/vim/rc/theme-setups`.
function! SetThemeTo(theme, dark_or_light)
  let l:path = g:vim_theme_tweaks . a:theme . '-' . a:dark_or_light . '.vim'

  exec 'colorscheme ' . a:theme
  exec 'set background=' . a:dark_or_light

  if FileExists(l:path)
    exec 'source ' l:path
  endif

  " Refresh Airline if in a script.
  if exists(':AirlineRefresh')
    exec ':AirlineRefresh'
  endif
endfunction


" Execute the first command if we're in dayhours and the second one if we're
" not. Dayhours are defined by the g:day_starts_at and g_day_ends_at variables.
function! DayNightCommands(day_command, night_command)
  let l:is_day = strftime("%H") > g:day_starts_at && strftime("%H") < g:day_ends_at
  if l:is_day | exec a:day_command | else | exec a:night_command | endif
endfunction


" Source the dark/light colorscheme based on the time of the day.
" If the vim instance is a GUI vim, then source the colorscheme in
" g:gui_colorscheme and set the background appropriately, while if it's console
" vim source the custom theme setup.
" This is done since GUI vim don't screw up themes like console vim (at least
" with iTerm themes) does.
function! ColorschemeBasedOnTime()
  if has('gui_running')
    call DayNightCommands('set bg=light', 'set bg=dark')
    exec 'colorscheme ' . g:gui_colorscheme
  elseif !has('gui_running')
    call DayNightCommands(
      \ 'call SetThemeTo(g:light_colorscheme, "light")',
      \ 'call SetThemeTo(g:dark_colorscheme, "dark")'
      \ )
  endif
endfunction
