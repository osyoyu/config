set encoding=utf-8

set mouse=
set clipboard^=unnamed,unnamedplus
set hidden
set nobackup nowritebackup
set ttimeoutlen=20   " Delay for ESC key

set fileformat=unix
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,sjis

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
set cursorline
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
let mapleader = " "
nnoremap <Leader><Leader> :w<CR>

" === Language support ===
syntax on
filetype plugin indent on
let g:c_syntax_for_h = 1

"============================
" Plugin config
"============================
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'github/copilot.vim'
  if has('nvim') | Plug 'navarasu/onedark.nvim' | Plug 'joshdick/onedark.vim' | endif
  if has('nvim')
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/nvim-cmp'
  endif
call plug#end()

nnoremap <c-p> :GFiles<cr>
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_preview_window = ['down:50%:hidden', 'ctrl-_']

" gf ~/.config/nvim/init.lua
