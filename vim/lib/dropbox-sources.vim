let s:dbox = '~/Dropbox/Applications/vim/'
let s:files = ['abbreviations']

function! s:SourceStuff()
  for file in s:files
    if FileExists(s:dbox . file)
      exec 'source ' . s:dbox . file
    endif
  endfor
endfunction

call s:SourceStuff()
