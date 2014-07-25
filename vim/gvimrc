" Cool, a vimrc just for GUI vims!

" Always show tabs.
set showtabline=2

" Open in 'fullscreen' (what a mere hack this is).
set lines=999 columns=999

" Cursor.
set guicursor=a:blinkon0  " no blinking cursor plz

" Hide the menu bar, the toolbar and the scrollbar in gvim/MacVim.
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

" God please don't beeeeeeeeeeeeeeep all the time.
set visualbell t_vb=

" Set GUI font based on being on a Mac (with MacVim) or on Linux
" (with vim-gnome or vim-gtk).
if has('gui_macvim')
  set guifont=Inconsolata-g\ for\ Powerline:h14
elseif has('gui_gtk')
  set guifont=Inconsolata-g\ Medium\ 11
end
