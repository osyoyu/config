return {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp' },
  root_markers = { '.clangd', '.git', },
  capabilities = {
    textDocument = {
      completion = {
        editsNearCursor = true,
      },
    },
    offsetEncoding = { 'utf-8', 'utf-16' },
  },
}
