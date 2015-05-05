" This is kind of trashy, but let's leave it on for now.
syntax keyword cElixirFn fn conceal cchar=λ
syntax match cElixirArrow '->' conceal cchar=→
syntax match cElixirFatArrow '=>' conceal cchar=⇒
syntax match cElixirPipe '|>' conceal cchar=➡

setlocal conceallevel=2

" Brings Markdown syntax in. I didn't set up a `syntax/markdown.vim` directory
" myself; vim figures this out from the runtimepath, so I just installed the
" 'plasticboy/vim-markdown' plugin.
syntax include @markdown syntax/markdown.vim

syntax region elixirTripleQuotedString start='"""' end='"""' contains=@markdown
