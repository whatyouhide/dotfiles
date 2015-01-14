" Return true if a file exists *and* is readable, false otherwise.
function! FileExists(path)
  return filereadable(expand(a:path))
endfunction


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
  if FileExists(l:path)
    execute 'source ' . l:path
  endif

  " Refresh Airline if present (so that you can set Airline options in the
  " tweaks files, and they'll get read).
  if exists('g:loaded_airline') && exists(':AirlineRefresh')
    exec 'AirlineRefresh'
  endif
endfunction

" Toggle between dark and light colorschemes as defined by the
" `g:colorscheme_[light|dark]` variables.
function! ToggleLightAndDarkColorschemes()
  if g:colors_name ==# g:colorscheme_light
    execute 'colorscheme ' . g:colorscheme_dark
    set bg=dark
  else
    execute 'colorscheme ' . g:colorscheme_light
    set bg=light
  endif
endfunction

function! VimuxRunTestCommand()
  if exists('b:vimux_test_command')
    call VimuxRunCommand('clear; ' . b:vimux_test_command)
  else
    echo 'The b:vimux_test_command variable is not defined.'
  endif
endfunction
