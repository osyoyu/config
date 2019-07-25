"============================
" Vim
"============================
set encoding=utf-8

nnoremap <F5> :<C-u>tabedit $MYVIMRC<CR>
nnoremap <F6> :<C-u>source $MYVIMRC<CR>

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'

" Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'vim-scripts/nginx.vim', { 'for': 'nginx' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'google/vim-jsonnet', { 'for': 'jsonnet' }

call plug#end()


"============================
" Editor
"============================
set number
set list
set listchars=tab:>\ ,trail:_,nbsp:!
" match Error /\v\s+%#@!$/

" set cursorline

" status bar
set laststatus=2
set statusline=%F%4(\ %m%)\ %y\ [%{&encoding}/%{&fileformat}]%=\ %l/%L\ %c%V%=%l,%c%V\ [Unicode=\%B]

" tabs
set tabstop=2
set shiftwidth=2
set expandtab

set whichwrap=b,s,h,l,<,>,[,]
set backspace=start,indent,eol
filetype plugin indent on

" syntax and indent
syntax on

augroup filetypes
  autocmd!
  autocmd BufNewFile,BufRead *.erb set filetype=eruby.html
  autocmd BufNewFile,Bufread *.md  set filetype=markdown
  " autocmd BufEnter *.cpp NeoSnippetSource ~/.vim/snippets/contest-cpp.snip
augroup END

augroup indents
  autocmd!
  "autocmd BufNewFile,BufRead *.{c,h,cpp} set ts=4 | set sw=4
augroup END

" search
set smartcase

" misc
set ambiwidth=double

" Bracketed-paste mode support (see :help xterm-bracketed-paste)
if &term =~ "screen"
  let &t_BE = "\e[?2004h"
  let &t_BD = "\e[?2004l"
  exec "set t_PS=\e[200~"
  exec "set t_PE=\e[201~"
endif

"============================
" Key Mappings
"============================
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> gT
nnoremap <Right> gt
nnoremap <Space> :w<CR>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

nnoremap Q <Nop>

nnoremap <F9> :set smartcase!<CR>

"============================
" File
"============================
set fileformat=unix
set fileencoding=utf-8

set fileencodings=utf-8,ucs-bom,sjis,cp932,euc-jp,iso-2022-jp

"============================
" Backup
"============================
set backupskip=/tmp/*,/private/tmp/*

"============================
" View
"============================
" highlight LineNr ctermfg=60
"
" " http://d.hatena.ne.jp/thinca/20090530/1243615055
" augroup vimrc-auto-cursorline
"   autocmd!
"   autocmd CursorMoved,CursorMovedI,WinLeave * setlocal nocursorline
"   autocmd CursorHold,CursorHoldI * setlocal cursorline
" augroup END

"============================
" lightline
"============================
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"RO":""}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ }
      \ }
