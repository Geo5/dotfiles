
if exists("g:loaded_sessions")
  finish
endif
let g:loaded_sessions = 1

"session save dir
if !exists("g:sessions_dir")
  if has('linux')
    let g:sessions_dir = $HOME . "/.local/share/vim/sessions" . getcwd()
  else
    let g:sessions_dir = $HOME . "/_vim/sessions" . getcwd()
  endif
endif

function MakeSession(overwrite) abort
  if (filewritable(g:sessions_dir) != 2)
    exe 'silent !mkdir -p ' g:sessions_dir
    redraw!
  endif
  let b:filename = g:sessions_dir . '/session.vim'
  if a:overwrite == 0 && !empty(glob(b:filename))
    return
  endif
  exe "mksession! " . b:filename
endfunction

function LoadSession() abort
  let b:sessionfile = g:sessions_dir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

" Adding automatons for when entering or leaving Vim
if(argc() == 0)
  au VimEnter * nested :call LoadSession()
  au VimLeave * :call MakeSession(1)
else
  au VimLeave * :call MakeSession(0)
endif
