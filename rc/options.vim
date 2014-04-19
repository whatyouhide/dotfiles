" Options
" =======


" Tabs and backspace should behave cool, shouldn't they?
set tabstop=2                   " tabs are 2 spaces width
set expandtab                   " expand tabs to spaces
set shiftwidth=2                " indent with two spaces
set softtabstop=2               " just make this equal to shiftwidth
set backspace=indent,eol,start  " WTF backspace?

" Autowrap is enabled by default if I set the textwidth option.
set textwidth=80


" Without this, vim doesn't use RVM ruby. Wtf I don't know.
set shell=sh

" Turn line numbers on using relative numbers. Cool. Cool cool cool.
set relativenumber

" Highlight current line.
set cursorline

" Always show the tab bar (0 for never, 1 for auto).
set showtabline=2

" Start scrolling when there are n lines between the cursor and the
" top/bottom of the screen.
set scrolloff=8

" Don't keep nasty swap/tmp/backup files. No more ~.
set nobackup
set nowritebackup
set noswapfile

" Splits 'naturally' by opening new splits below/right to the current one.
set splitbelow
set splitright

" Toggle paste mode with <F7> (useful when pasting from the system command
" line.
set pastetoggle=<F2>
