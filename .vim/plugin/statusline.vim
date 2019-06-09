"Do not guard this plugin for multiple loadings, because it could change often


function! Status(winnum)
  let active = a:winnum == winnr()

  function! Color(active, highgroup, content) abort
    if a:active
      return '%#' . a:highgroup . '#' . a:content . '%*'
    else
      return a:content
    endif
  endfunction
  
  let stat = ''
  " this handles alternative statuslines
  let usealt = 0
  let altstat = ''
  
  let l:mode=mode()
  if l:mode==#"n"
    let stat.=Color(active, "WildMenu", " NORMAL ")
  elseif l:mode==?"v" || l:mode ==# "x22"
    let stat.=Color(active, "IncSearch", " VISUAL ")
  elseif l:mode==#"i"
    let stat.=Color(active, "Search", " INSERT ")
  elseif l:mode==#"R"
    let stat.=" REPLACE "
  elseif l:mode==?"s"
    let stat.=" SELECT "
  elseif l:mode==#"t"
    let stat.=Color(active, "WildMenu", " TERMINAL ")
  elseif l:mode==#"c"
    let stat.=Color(active, "WildMenu", " COMMAND ")
  elseif l:mode==#"!"
    let stat.=Color(active, "WildMenu", " SHELL ")
  else
    let stat.="   " . l:mode . "   "
  endif

  let bufnum = winbufnr(a:winnum)
  let type = getbufvar(bufnum, '&buftype')
  let name = bufname(bufnum)
  if type ==# 'help'
    let altstat .= Color(active, "ToolbarButton", "  HELP  ") . " " . fnamemodify(name, ':t:r')
    let usealt = 1
  elseif name ==# '__Gundo__'
    let altstat .= "        "
    let altstat .= ' Gundo'
    let usealt = 1
  elseif name ==# '__Gundo_Preview__'
    let altstat .= "        "
    let altstat .= ' Gundo Preview'
    let usealt = 1
  endif

  "filepath
  let stat.=Color(active, "StatusLine", " %{pathshorten(fnamemodify(expand('%'), ':~:.'))}")

  "readonly
  let stat.="%( %{&readonly?'':''}%)"
  let altstat.=" %{&readonly?'':''}"
  "buffernumber
  let stat.="%( #%{&buflisted?bufnr('%'):''}%)"
  "file type
  let stat.=" %y"

  "git branch
  "TODO: detect branch only for current buffer
  if exists('*fugitive#head')
    let head = fugitive#head()

    if empty(head) && exists('*fugitive#detect') && !exists('b:git_dir')
      call fugitive#detect(getcwd())
      let head = fugitive#head()
    endif
    if !empty(head)
      let stat .= Color(active, "StatusLineSubtle", " @ " . head . " ")
    endif
  endif


  " right side
  let stat .= '%=%<'
  let altstat .= '%=%<'

  "spellang
  let stat .= Color(active, "SpellCap" , "%( %{&spell?&spelllang:''} %)")

  "linting errors and warnings
  let l:ale_counts = ale#statusline#Count(bufnr(''))
  let l:ale_all_errors = l:ale_counts.error + l:ale_counts.style_error
  let l:ale_all_non_errors = l:ale_counts.total - l:ale_all_errors
  if l:ale_all_errors != 0
    let stat.= Color(active, "ALEWarning", " W:" . l:ale_all_non_errors . " ")
    let stat.= Color(active, "ALEError", "E:" . l:ale_all_errors . " ")
  endif
  
  "fileformat and encoding
  let stat .=" %{&fileencoding?&fileencoding:&encoding}"
  let stat .="(%{&fileformat})"

  "flags
  let stat .="%( [%{&modified?'+':''}%R%q]%)" 

  "character value under cursor
  let stat.=Color(active, "StatusLineSubtle", " 0x%04B")
  let altstat.=Color(active, "StatusLineSubtle", " 0x%04B")

  "line and column number and percent
  let stat.=" | %17(%l/%4L:%3c %P%)"
  let altstat.=" | %17(%l/%4L:%3c %P%)"

  if usealt
    return altstat
  endif

  return stat
endfunction

set statusline=%!Status(winnr())
" Status AutoCMD: {{{

function! s:RefreshStatus()
  for nr in range(1, winnr('$'))
    call setwinvar(nr, '&statusline', '%!Status(' . nr . ')')
  endfor
endfunction

augroup status
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * call <SID>RefreshStatus()
augroup END
" }}}
