-- git clone --filter=blob:none --branch=stable https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

-- Basics
vim.opt.mouse = ''
vim.opt.clipboard:append({'unnamed', 'unnamedplus'})
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.ttimeoutlen = 20 -- Delay for ESC key

-- File
vim.opt.fileencoding = 'utf-8'
vim.opt.fileencodings = {'utf-8', 'ucs-bom', 'sjis'}

-- Editor
vim.opt.number = true
vim.opt.list = true
vim.opt.listchars = {tab = '> ', trail = '_', nbsp = '!'}
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.backspace = {'indent', 'start'}

-- Search
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- Appearance
vim.opt.display:append({'lastline'})  -- Display very long lines
vim.opt.pumheight = 3                 -- Limit completion window to 3 lines
vim.opt.cursorline = true
vim.opt.signcolumn = 'number'
vim.opt.laststatus = 0
vim.opt.termguicolors = true

-- Key mappings
vim.keymap.set('n', 'Y', 'y$', { noremap = true })
vim.keymap.set('n', 'Q', '<Nop>', { noremap = true })
vim.keymap.set('n', '<M-i>', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { noremap = true })
vim.keymap.set('n', 'ff', function()
  vim.lsp.buf.format()
end, { noremap = true })

-- Syntax highlighting
vim.opt.syntax = 'on'
vim.opt.filetype = 'on'

-- Plugins
require("lazy").setup({
  spec = {
    { 'navarasu/onedark.nvim' },
    { 'tpope/vim-surround' },
    { 'tpope/vim-fugitive' },
    { 'junegunn/fzf' },
    { 'junegunn/fzf.vim' },

    {
      'saghen/blink.cmp',
      version = '0.11.0',
      ---@module 'blink.cmp'
      ---type blink.cmp.Config
      opts = {
        keymap = {
          preset = 'default',
          ['<CR>'] = { 'select_and_accept', 'fallback' },
        },
        sources = {
          default = { 'lsp', 'buffer', 'path' },
        },
        completion = {
          list = {
            selection = { preselect = false },
          },
          accept = {
            auto_brackets = { enabled = false },
          },
          menu = { auto_show = function(ctx) return ctx.mode ~= 'cmdline' end }
        },
      },
      opts_extend = { "sources.default" }
    },

    { 'neovim/nvim-lspconfig' },
    { 'j-hui/fidget.nvim' },
    { 'github/copilot.vim' },
  },
  -- automatically check for plugin updates
  -- checker = { enabled = true },
})

-- Plugin config
require('onedark').setup({
  style = 'cool',
})
require('onedark').load()
vim.api.nvim_set_hl(0, "Comment", { fg = "#999999" })
vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#999999" })

vim.keymap.set('n', '<c-p>', ':GFiles<cr>', { noremap = true })
vim.g.fzf_layout = { down = '~40%' }
vim.g.fzf_preview_window = {'down:50%:hidden', 'ctrl-_'}

-- LSP
local lspconfig = require('lspconfig')
lspconfig.clangd.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.ruby_lsp.setup({
  init_options = {
    formatter = 'auto',
    linters = { 'rubocop' },
  },
})
