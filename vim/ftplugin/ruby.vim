" Retrieve just the filename (eg. 'something_test.rb') and set the default
" dispatch command if it's a test or spec file.
let s:current_filename = fnamemodify(expand('%'), ':t')
if match(s:current_filename, 'test') > 0 || match(s:current_filename, 'spec') > 0
  let b:dispatch = 'ruby %'
endif
