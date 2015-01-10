if getcwd() =~ 'exercism'
  let s:filename = fnamemodify(expand('%'), ':r')
  let s:dir = fnamemodify(expand('%'), ':h')

  for test_file in split(glob(s:dir . '/*_test.ex*'), '\n')
    if test_file =~ s:filename
      let b:vimux_test_command = 'elixir ' . test_file
      break
    endif
  endfor
end

set wildignore+=docs/*,deps/*
