"tab-stuff
set tabstop=8
set softtabstop=4
set expandtab
set shiftwidth=4
"mark column 88 onwards (default value of black)
let &colorcolumn=join(range(88, 999), ",")
"""""""""remove trailig whitespace function on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
"auto bracket closing
inoremap <buffer> " ""<left>
inoremap <buffer> """ """"""<left>
inoremap <buffer> ' ''<left>
inoremap <buffer> ( ()<left>
inoremap <buffer> [ []<left>
inoremap <buffer> { {}<left>
