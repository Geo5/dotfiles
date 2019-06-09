"tab-stuff
setlocal tabstop=8
setlocal softtabstop=4
setlocal expandtab
setlocal shiftwidth=4
"mark column 88 onwards (default value of black)
let &l:colorcolumn=join(range(88, 999), ",")
"remove trailig whitespace function on save
autocmd BufWritePre <buffer> call StripTrailingWhitespace()

"how to reset ftplugin options
let b:undo_ftplugin.= "|setlocal tabstop< |setlocal softtabstop< | setlocal expandtab< | setlocal shiftwidth<"
