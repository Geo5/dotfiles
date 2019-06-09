
if exists("g:loaded_strip_trailing_whitespace")
  finish
endif
let g:loaded_strip_trailing_whitespace = 1
nnoremap <Plug>StripTrailingWhitespace :call StripTrailingWhitespace()<CR>

function StripTrailingWhitespace() abort
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

