" Commands
" ========

" Open a markdown file in Marked 2.app (only on OSX).
if has('unix') && system('uname -s') == "Darwin\n"
  command! Marked silent exec "!open -a 'Marked 2' %" | redraw!
endif
