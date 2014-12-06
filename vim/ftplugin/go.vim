setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal smartindent

" Local leader maps.
nnoremap <localleader>gl :GoLint<CR>
nnoremap <localleader>gi :GoImports<CR>
nnoremap <localleader>gv :GoVet<CR>
nnoremap <localleader>gb :GoBuild<CR>
nnoremap <localleader>gI :GoInstall<CR>
nnoremap <localleader>gt :GoTest<CR>
