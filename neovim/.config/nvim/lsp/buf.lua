return {
  cmd = { 'buf', 'lsp', 'serve', '--log-format=text' },
  filetypes = { 'proto' },
  root_markers = { 'buf.yaml', '.git' },
  reuse_client = function(client, config)
    -- `buf lsp serve` is meant to be used with multiple workspaces.
    return client.name == config.name
  end,
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end,
}
