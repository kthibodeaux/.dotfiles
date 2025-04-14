return {
  cmd = { 'rubocop', '--lsp' },
  filetypes = { 'ruby' },
  root_markers = { 'Gemfile', '.git' },
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end,
}
