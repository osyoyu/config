vim.cmd.source('~/.vimrc')

vim.keymap.set('n', '<M-i>', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { noremap = true })
vim.keymap.set('n', 'ff', function()
  vim.lsp.buf.format()
end, { noremap = true })

vim.cmd('let g:c_syntax_for_h = 1')

require('onedark').setup({
  style = 'cool',
})
require('onedark').load()
vim.api.nvim_set_hl(0, "Comment", { fg = "#999999" })
vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#999999" })

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
