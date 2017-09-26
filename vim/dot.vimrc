"============================
" Vim
"============================
set encoding=utf-8

nnoremap <F5> :<C-u>tabedit $MYVIMRC<CR>
nnoremap <F6> :<C-u>source $MYVIMRC<CR>

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \   'windows' : 'tools\\update-dll-mingw',
      \   'cygwin' : 'make -f make_cygwin.mak',
      \   'mac' : 'make -f make_mac.mak',
      \   'unix' : 'make -f make_unix.mak',
      \   },
      \ }

" Completion
"NeoBundle 'Shougo/neocomplete.vim'
"NeoBundle 'Shougo/neosnippet.vim'
"NeoBundle 'Shougo/neosnippet-snippets'

" Vim
NeoBundle 'tpope/vim-surround'
NeoBundle 'itchyny/lightline.vim'

" Ruby and Ruby on Rails
"NeoBundle "osyo-manga/vim-monster"
"NeoBundle "tpope/vim-rails"

" JavaScript and AltJS
NeoBundle "pangloss/vim-javascript"
NeoBundle "kchmck/vim-coffee-script"

" Other languages
NeoBundle 'slim-template/vim-slim'
NeoBundle 'nginx.vim'

call neobundle#end()
NeoBundleCheck

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
highlight LineNr ctermfg=60

" http://d.hatena.ne.jp/thinca/20090530/1243615055
augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI,WinLeave * setlocal nocursorline
  autocmd CursorHold,CursorHoldI * setlocal cursorline
augroup END

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

"============================
" neocomplete
"============================
if neobundle#is_installed('neocomplete.vim')
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  " let g:neocomplete#enable_camel_case = 1
  let g:neocomplete#sources#syntax#min_keyword_length = 3

  " dictonaries
  let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ }

  " fire omni-complete
  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {
          \   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
          \}
  endif

  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplcache#undo_completion()
  inoremap <expr><C-l>     neocomplcache#complete_common_string()

  " Key mappings from https://github.com/Shougo/neocomplete.vim
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    "return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplete#close_popup()
  inoremap <expr><C-e>  neocomplete#cancel_popup()
endif

"============================
" neosnippet
"============================
if neobundle#is_installed('neosnippet.vim')
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \ : "\<TAB>"

  " For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif
endif

"============================
" vim-monster
"============================
let g:monster#completion#rcodetools#backend = "async_rct_complete"
