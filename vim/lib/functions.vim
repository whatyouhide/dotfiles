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


" Eat a character matching
function! AbbrevEatSpace()
  let c = nr2char(getchar(0))
  return (c =~ '\s') ? '' : c
endfunction

" Create an abbreviation (with 'iabbrev'). If the third parameter is
" 'spaceless', the space after the abbreviation will disappear.
function! Abbrev(from, to, ...)
  let cmd = join(['iabbrev <silent>', a:from, a:to], ' ')

  if a:0 > 0 && a:1 ==? 'spaceless'
    let cmd .= '<C-R>=AbbrevEatSpace()<CR>'
  endif

  exec cmd
endfunction


" Get the currently visually selected text.
" Thanks to http://goo.gl/4MCjnS
function! VisualSelection()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction


" Sent the visually selected text to a tmux pane through Vimux (this emulates
" the functionality of tslime.vim).
function! VimuxSlime(...)
  let text = VisualSelection()
  call VimuxOpenRunner()
  call VimuxSendText(text)

  if a:0 > 0
    let after_keys = a:1
    call VimuxSendText(after_keys)
  else
    call VimuxSendText("\n")
  endif
endfunction
