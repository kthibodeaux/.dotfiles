require("lsp-zero").preset("recommended").setup()

vim.diagnostic.config({
  virtual_text = false,
})

vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float({scope="line"})]])
