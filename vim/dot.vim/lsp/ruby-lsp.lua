return {
  filetypes = { "ruby" },
  cmd = { "ruby-lsp" },
  root_markers = { "Gemfile", ".git" },
  init_options = {
    formatter = "auto",
    linters = { "rubocop" },
  },
}
