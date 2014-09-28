" Options
" =======


" Use utf-8.
scriptencoding utf-8
set encoding=utf-8

" Use 256 colors.
set t_Co=256

" Tabs and backspace should behave cool, shouldn't they?
set tabstop=2                   " tabs are 2 spaces width
set expandtab                   " expand tabs to spaces
set shiftwidth=2                " indent with two spaces
set softtabstop=2               " just make this equal to shiftwidth
set backspace=indent,eol,start  " WTF backspace?
set smartindent                 " don't indent 2 spaces everytime, be smart

" Autowrap is enabled by default if I set the textwidth option.
set textwidth=80

" Without this, vim doesn't use RVM ruby.
set shell=sh

" Use per-project .vimrc files.
set exrc

" Only allow secure commands in per-project .vimrcs.
set secure

" Turn line numbers on using relative numbers for lines that aren't the curren
" line, and absolute number for the current line.
set relativenumber
set number

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

" Searching.
" Be case-insensitive except when using Capital characters in the pattern.
set ignorecase
set smartcase
" Highlight search results.
set hlsearch
" Highlight matches while still writing the search pattern.
set incsearch

" Assume the /g flags on :s subsitutions. (thanks Ben Orenstein)
set gdefault

" Splits 'naturally' by opening new splits below/right to the current one.
set splitbelow
set splitright

" Toggle paste mode with <F7> (useful when pasting from the system clipboard).
set pastetoggle=<F7>

" Remove ugly splits/window/pane (whatever you call them) separators.
set fillchars=""

" Highlight stuff with special characters.
" There's an autocmd which disables 'list' when in insert mode because come on.
set list
set listchars=tab:▸\ ,trail:·

" Wild menu.
set wildmenu
set wildignore+=.git
set wildignore+=*._DS_Store,*.sass-cache
set wildignore+=*.jpg,*.jpeg,*.gif,*.png

" Spell checking.
" (note: `spell` is disabled by default, and it's enabled through autocommands
" on files that need it)
set spelllang=en,it

" Clipboard management: when you delete/yank to the unnamed register ("*), send
" that to the clipboard (this works in a tmux session because of
" reattach-to-user-namespace in tmux.conf, on OSX).
set clipboard=unnamed
