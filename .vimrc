
execute pathogen#infect()
"colorscheme
let g:dracula_italic = 0
let g:dracula_bold = 0
set termguicolors
colorscheme dracula
syntax on
"set spell spelllang=en_gb

filetype plugin indent on
set encoding=utf-8
let mapleader=","
let maplocalleader="#"

"Use system clipboard
set clipboard=unnamed
"linenumber
set number
"tab-stuff
set tabstop=8
set softtabstop=4
set expandtab
set shiftwidth=4

set autoindent
"set showmatch
let python_highlight_all=1
set foldmethod=indent
set foldlevel=99
"search stuff
set hlsearch
set ignorecase
set smartcase
"allow unsafed buffers to be hidden
set hidden
"split opens right
set splitright
"""""""""vim key mappings
"map q to close help window
autocmd FileType help nnoremap <buffer> q :q<CR>
"open vimrc
nnoremap <leader>rc :vsplit $MYVIMRC<cr>
"source vimrc
nnoremap <leader>sc :source $MYVIMRC<cr>
"folding
nnoremap <space> za
inoremap <C-@> <C-O>za
"move to the next buffer
noremap <leader>l :bnext<CR>
"move to previos buffer
noremap <leader>h :bprevious<CR>
"open new buffer
noremap <leader>N :enew<CR>
"close current buffer and move to previous
noremap <leader>W :bp <BAR> bd #<CR>
"move to splits
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
inoremap <C-J> <C-O><C-W>j
inoremap <C-K> <C-O><C-W>k
inoremap <C-L> <C-O><C-W>l
inoremap <C-H> <C-O><C-W>h
"save on ctrl-s
nnoremap <C-S> :w<CR>
inoremap <C-S> <C-O>:w<CR>
"arrow keys move 5 up
nnoremap <Up> 5<Up>
nnoremap <Down> 5<Down>
"clear last seach pattern
nnoremap <leader>c :let @/=""<CR>
"nnoremap <esc> :noh<return><esc>
"clear search highlight on entering insert mode
"autocmd InsertEnter * :noh
"map Y do yank to the end of the line
nnoremap Y y$

""""""""plugin config
"Folding
let g:SimplyFold_docstring_preview=1
"Force updating even on ident fold mode
let g:fastfold_force = 1
"Enable folding on small files aswell
let g:fastfold_minlines = 0

"NerdTree
let NERDTreeIgnore=['\.pyc$', '\~$']
nnoremap <leader>- :NERDTreeToggle<CR>

"Tagbar
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
nnoremap <leader>ö :TagbarToggle<CR>

"Jedi
let g:jedi#completions_enabled = 0
let g:jedi#use_splits_not_buffers = "right"
"let g:jedi#completions_command = "<S-Space>"

"deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('yarp', v:true)

"supertab
let g:SuperTabRetainCompletionDuration = 'completion'
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabDefaultCompletionType = 'context'
"autocmd FileType *
"\ if &omnifunc != '' |
"\   call SuperTabChain(&omnifunc, "<c-p>") |
"\ endif

"ale
let g:ale_sign_column_always=1
let g:ale_fixers = {'python': ['remove_trailing_lines', 'isort', 'black']}
let g:ale_python_pylint_change_directory=0
let g:ale_python_isort_options='-tc -up -w 88 -m 5'
"let g:ale_python_black_options='--py36'
nnoremap <Leader>. :ALEFix<CR>

"airline config
let g:airline#extensions#ale#enabled=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

