vim.lsp.enable('golangci_lint_ls')
vim.lsp.enable('gopls')
vim.lsp.enable('luals')
vim.lsp.enable('rubocop')
vim.lsp.enable('ruby_lsp')
vim.lsp.enable('ts_ls')

vim.diagnostic.config({
  virtual_lines = {
   current_line = true,
  },
})

vim.api.nvim_set_keymap('n', '<leader>la', '<CMD> lua vim.lsp.buf.code_action()<CR>', { noremap = true, desc = 'code action' })
vim.api.nvim_set_keymap('n', '<leader>lh', '<CMD> lua vim.lsp.buf.hover()<CR>', { noremap = true, desc = 'documentation' })
vim.api.nvim_set_keymap('n', '<leader>ld', '<C-]>', { noremap = true, desc = 'go to definition' })
vim.api.nvim_set_keymap('n', '<leader>lr', '<CMD> lua vim.lsp.buf.references()<CR>', { noremap = true, desc = 'references' })
