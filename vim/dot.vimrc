set encoding=utf-8

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'github/copilot.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

set mouse=
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
set backspace=indent,start

" === Search ===
set smartcase
set nohlsearch

" === Appearance ===
set display+=lastline  " Display very long lines
set pumheight=3        " Limit completion window to 3 lines
set cursorline
set ambiwidth=double   " For CJK
set signcolumn=number
set laststatus=0

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set background=dark

" === Key Mapping ===
nnoremap Y y$
nnoremap Q <Nop>

" === Language support ===
syntax on
filetype plugin indent on

"============================
" Plugin config
"============================
nnoremap <c-p> :GFiles<cr>
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_preview_window = ['down:50%:hidden', 'ctrl-_']
