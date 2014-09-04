" Get rid of the vi stuff and fully embrace vim.
set nocompatible

" Where vim sourceable files are stored (and a function that sources based on
" that value).
let g:vim_libs = '~/.vim/lib/'
let g:vim_theme_tweaks = '~/.vim/theme-tweaks/'

function! SourceExternalFile(file)
  exec 'source ' . g:vim_libs . a:file
endfunction

" Source plugins I'm developing (works-in-progress.vim is not version
" controlled) before regular plugins, in order to be able to have plugin
" dopplegangers.
if filereadable(expand("~/.vim/works-in-progress.vim"))
  source ~/.vim/works-in-progress.vim
endif

" Plugins.
call SourceExternalFile('plugins.vim')


" Enable file type detection and do language-dependent indenting (this
" also 'closes' vundle, and it's *required*).
filetype plugin indent on

" Turn on syntax highlighting.
syntax on

" Enable the matchit plugin (required by textobj-rubyblock).
runtime macros/matchit.vim

" External sources.
call SourceExternalFile('options.vim')
call SourceExternalFile('functions.vim')
call SourceExternalFile('autocmds.vim')
call SourceExternalFile('commands.vim')
call SourceExternalFile('mappings.vim')
call SourceExternalFile('leader-mappings.vim')
call SourceExternalFile('plugin-configs.vim')

" Some custom configurations.

" Choose a dark and a light themes...
let g:light_colorscheme = $DOTFILES_VIM_LIGHT_COLORSCHEME
let g:dark_colorscheme = $DOTFILES_VIM_DARK_COLORSCHEME
let g:gui_colorscheme = $DOTFILES_GUI_VIM_COLORSCHEME
" ...with defaults.
if empty(g:light_colorscheme) | let g:light_colorscheme = 'ocean-light' | endif
if empty(g:dark_colorscheme)  | let g:dark_colorscheme = 'ocean-dark'   | endif
if empty(g:gui_colorscheme)   | let g:gui_colorscheme = 'base16-ocean'  | endif

" Day/night hours (used to choose between light and dark colorschemes).
let g:day_starts_at = 8
let g:day_ends_at = 19

" Light theme during day hours, dark otherwise.
call ColorschemeBasedOnTime()
