return {
  cmd = { 'ruby-lsp' },
  filetypes = { 'ruby' },
  root_markers = { 'Gemfile', '.git' },
  init_options = {
    formatter = "auto",
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
  end,
}
