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
set list listchars=tab:>\ ,trail:_,nbsp:!
set tabstop=2 shiftwidth=2 expandtab
set backspace=start

" === Search ===
set smartcase
set nohlsearch

" === Appearance ===
set display+=lastline  " Display very long lines
set signcolumn=number
set pumheight=10

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
" Emacs-ish command line editing
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

" === Language support ===
syntax on
filetype plugin indent on
let g:c_syntax_for_h = 1

"============================
" Plugin config
"============================
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'github/copilot.vim'
  Plug 'joshdick/onedark.vim'
  Plug 'yegappan/lsp'
call plug#end()

colorscheme onedark

" === Misc plugins ===
nnoremap <c-p> :GFiles<cr>
let g:fzf_layout = { 'down': '~40%' }
let g:copilot_filetypes = {'*': v:true, 'text': v:false, 'markdown': v:false}

" === LSP ===
let lspOpts = #{autoHighlightDiags: v:true}
autocmd User LspSetup call LspOptionsSet(lspOpts)
let lspServers = [
  \  #{
  \    name: 'clangd',
  \    filetype: ['c', 'cpp'],
  \    path: '/usr/bin/clangd',
  \    args: ['--background-index']
  \ },
  \  #{
  \    name: 'ruby-lsp',
  \    filetype: ['rb'],
  \    path: '/home/osyoyu/.rbenv/shims/ruby-lsp',
  \    args: []
  \ }
  \ ]
autocmd User LspSetup call LspAddServer(lspServers)
