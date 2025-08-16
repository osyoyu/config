vim.cmd.source('~/.vimrc')

vim.keymap.set('n', '<M-i>', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { noremap = true })
vim.keymap.set('n', 'ff', function()
  vim.lsp.buf.format()
end, { noremap = true })

require('onedark').setup({
  style = 'cool',
  highlights = {
    Comment = { fg = '#888888' },
    SpecialComment = { fg = '#888888' },
    LspInlayHint = { fg = '#999999' },
    String = { fg = "#a5b0c5" },
    Character = { fg = "#a5b0c5" },
    Number = { fg = "#a5b0c5" },
    Float = { fg = "#a5b0c5" },
    Boolean = { fg = "#a5b0c5" },
    Type = { fg = "#a5b0c5" },
    Structure = { fg = "#a5b0c5" },
    StorageClass = { fg = "#a5b0c5" },
    Identifier = { fg = "#a5b0c5" },
    Constant = { fg = "#a5b0c5" },
    PreProc = { fg = "#a5b0c5" },
    PreCondit = { fg = "#a5b0c5" },
    Include = { fg = "#a5b0c5" },
    Keyword = { fg = "#a5b0c5" },
    Define = { fg = "#a5b0c5" },
    Typedef = { fg = "#a5b0c5" },
    Exception = { fg = "#a5b0c5" },
    Conditional = { fg = "#a5b0c5" },
    Repeat = { fg = "#a5b0c5" },
    Statement = { fg = "#a5b0c5" },
    Macro = { fg = "#a5b0c5" },
    Error = { fg = "#a5b0c5" },
    Label = { fg = "#a5b0c5" },
    Special = { fg = "#a5b0c5" },
    SpecialChar = { fg = "#a5b0c5" },
    Function = { fg = "#a5b0c5" },
    Operator = { fg = "#a5b0c5" },
    Title = { fg = "#a5b0c5" },
    Tag = { fg = "#a5b0c5" },
    Delimiter = { fg = "#a5b0c5" },
    -- Comment = { fg = "#a5b0c5" },
    -- SpecialComment = { fg = "#a5b0c5" },
    Todo = { fg = "#a5b0c5" },
  },
})
require('onedark').load()

local cmp = require('cmp')
cmp.setup({
  window = {},
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  }),
  completion = { completeopt = "noselect" },
  preselect = cmp.PreselectMode.None,
})

-- LSP

local lspconfig = require('lspconfig')
lspconfig.clangd.setup({})
lspconfig.rust_analyzer.setup({})
-- lspconfig.ruby_lsp.setup({
--   init_options = {
--     formatter = 'auto',
--     linters = { 'rubocop' },
--   },
-- })
lspconfig.gopls.setup({})

vim.lsp.enable("ruby-lsp")

local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.config('*', {
  capabilities = capabilities,
  on_attach = function(client)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

require('fidget').setup {}

-- vim.cmd'syntax off'
vim.diagnostic.config({ virtual_text = true })
