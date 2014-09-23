" (NOTE: some functions in this file are mapped. This mappings are located
" inside mappings.vim.


" When a colorscheme (or the bg option) changes, this function gets called.
" If it finds a file inside g:theme_tweaks_dir named '{colorscheme}.vim', it
" will source it. It's ideal for tweaking vim colorschemes in order to make them
" work perfectly.
" g:theme_tweaks_dir defaults to '~/.vim/theme-tweaks'. There must be no
" trailing slash.
function! TweakColorscheme()
  " Set the default value.
  if !exists('g:theme_tweaks_dir')
    let g:theme_tweaks_dir = '~/.vim/theme-tweaks'
  endif

  " Find the path of the file and, if that file exists, source it.
  let l:path = g:theme_tweaks_dir . '/' . g:colors_name . '.vim'
  if filereadable(expand(l:path))
    execute 'source ' . l:path
  endif

  " Refresh Airline if present (so that you can set Airline options in the
  " tweaks files, and they'll get read).
  if exists(':AirlineRefresh') | exec 'AirlineRefresh' | endif
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
  call DayNightCommands('set bg=light', 'set bg=dark')

  if has('gui_running')
    exec 'colorscheme ' . g:gui_colorscheme
  elseif !has('gui_running')
    call DayNightCommands(
          \ 'colorscheme ' . g:light_colorscheme,
          \ 'colorscheme ' . g:dark_colorscheme
          \ )
  endif
endfunction
