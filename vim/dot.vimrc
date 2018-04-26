"============================
" Vim
"============================
set encoding=utf-8

nnoremap <F5> :<C-u>tabedit $MYVIMRC<CR>
nnoremap <F6> :<C-u>source $MYVIMRC<CR>

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

"dein -------------
"git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/repos/github.com/Shougo/dein.vim
let s:dein_dir = expand('~/.vim/dein')
let s:dein_core_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand('~/.vim')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif


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
