"============================
" Vim
"============================
set encoding=utf-8

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'cocopon/iceberg.vim'
Plug 'tpope/vim-surround'
" Plug 'itchyny/lightline.vim'

Plug 'neoclide/coc.nvim', { 'tag': '*', 'do': './install.sh nightly' }
Plug 'vim-scripts/nginx.vim', { 'for': 'nginx' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'google/vim-jsonnet', { 'for': 'jsonnet' }
call plug#end()


set clipboard^=unnamed,unnamedplus
set hidden
set nobackup nowritebackup
set updatetime=300
set ttimeoutlen=20   " Delay for ESC key

set fileformat=unix
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,sjis,cp932,euc-jp,iso-2022-jp

" === Editor ===
set number
set list listchars=tab:>\ ,trail:_,nbsp:!
set tabstop=2 shiftwidth=2 expandtab
set backspace=0

syntax on
filetype plugin indent on
augroup filetypes
  autocmd!
  autocmd BufNewFile,Bufread *.c   set ts=8 sw=4 sts=4 et
augroup END

" === Search ===
set smartcase
set nohlsearch

" === Appearance ===
set display=lastline  " Display very long lines
set pumheight=10      " Limit completion window to 10 lines
set cursorline
set laststatus=1      " Show statusline only when 2+ windows are open
set ambiwidth=double  " For CJK

set background=dark
colorscheme iceberg
" highlight clear SignColumn


"============================
" Key Mappings
"============================
inoremap jk <ESC>
nnoremap Y y$
nnoremap Q <Nop>


"============================
" Completion (coc.nvim)
"============================
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" don't give |ins-completion-menu| messages.
set shortmess+=c
