" pathogen must come before filetype on
set nocompatible
filetype off

let g:netrw_liststyle=3

" Section vundle {{{
set rtp+=~/.vundle
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'ColorSchemeMenuMaker'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'easymotion/vim-easymotion'
Plugin 'justinmk/vim-sneak'
"Plugin 'LucHermitte/lh-vim-lib'
"Plugin 'LucHermitte/local_vimrc'
"Plugin 'mnpk/vim-jira-complete'

" syntax support
Plugin 'plasticboy/vim-markdown'
Plugin 'elixir-lang/vim-elixir'
call vundle#end()
" }}}

filetype plugin indent on
syntax on
colorscheme jellybeans

set number
set relativenumber

" /searching defaults
set hlsearch
set smartcase

" just for mousewheel scrolling, I promise 0_o
set mouse=a

" trim trailing whitespace for python files (pep8)
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``

" moar pythons
au BufNewFile,BufRead *.tac set filetype=python

" key mapping
map <leader>t :NERDTreeToggle<CR>
map <leader>o :Tagbar<CR>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" Emacs-like beginning and end of line in insert mode
imap <c-e> <c-o>$
imap <c-a> <c-o>^

imap <c-space> <c-x><c-o>

" move screenlines not wrapped lines (duh)
nmap k gk
nmap j gj

" Easymode next/prev buffer. Old habit.
map <M-pagedown> :bn <CR>
map <M-pageup> :bp <CR>

" faster tab nav
nnoremap th  :tabprev<CR>
nnoremap tl  :tabnext<CR>
nnoremap tt  :tabclose<CR>

" plugin customisation
" --------------------

" jedi, only complete on c-space
let g:jedi#popup_on_dot = 0

" turn on git branch for airline
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" append .txt to vim notes
let g:notes_suffix = '.txt'
:let g:notes_directories = ['~/Dropbox/Shared Notes']

" filter things out of ctrlp

" filter things out of nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$', 'target']

let g:syntastic_python_checkers=['flake8']

" close quickfix when exiting insert mode (mostly for pydoc window popups)
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" tagbar
let g:tagbar_autoclose = 1
let g:tagbar_sort = 0  " sort by position


" Section Highlights {{{
" highlight the line where the cursor is at for my poor eyes
set cursorline
hi CursorLine term=NONE cterm=NONE guibg=Grey40

"highlight ColorColumn ctermbg=magenta
"call matchadd('ColorColumn', '\%81v', 100)
" }}}
" Section CtrlP config {{{

"set wildignore+=*.pyc,*.class,target
"let g:ctrlp_cmd = 'CtrlPCurWD'

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" }}}
" Section Spaces & Tabs {{{

" sane default whitespace/indent. Tabs, whoneedsem.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set expandtab

set list

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

" }}}

" allow dirty buffer switching (insert double entendre here)
set hidden

" Section vimrc {{{
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}
set modelines=1

" vim:foldmethod=marker:foldlevel=0
