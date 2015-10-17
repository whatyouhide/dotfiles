" This is kind of trashy, but let's leave it on for now.
syntax keyword cElixirFn fn conceal cchar=λ
syntax match cElixirArrow '->' conceal cchar=→
syntax match cElixirFatArrow '=>' conceal cchar=⇒
syntax match cElixirPipe '|>' conceal cchar=➡

setlocal conceallevel=2
