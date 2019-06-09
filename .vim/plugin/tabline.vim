
"Displays all opened buffers in the tabline
function! Tabline()
  let s = ''
  let last_bufnr = bufnr('$')
  let current_bufnr = winbufnr(winnr())
  "TODO: check columns variable and construct entrys with respect to window
  "width! 
  if current_bufnr >= last_bufnr / 2
    let s.="%<"
  endif
  for bufnr in range(1, last_bufnr)
    let bufname = bufname(bufnr)
    if buflisted(bufname)
      let current = bufnr == current_bufnr 
      let visible = bufwinid(bufnr) != -1
      let s .= '%' . bufnr . 'T'
      if current
        let s .= '%#TabLineSel#'
      elseif visible
        let s .= '%#Folded#'
      else
        let s .= '%#TabLine#'
      endif
      let s .= ' ' . bufnr .  ':'
      let s .= (bufname != '' ? '['. fnamemodify(bufname, ":t") . ']' : '[No Name]')
        
      let bufmodified = getbufvar(bufnr, "&mod")
      if bufmodified
        let s .= '[+] '
      endif
      let s.="%X"
    endif
  endfor
  let s .= '%#TabLine#'
  if current_bufnr < last_bufnr / 2
    let s.="%<"
  endif
  return s
endfunction

set tabline=%!Tabline()
