local buffer_map = vim.api.nvim_buf_set_keymap

vim.opt_local.expandtab = false
vim.opt_local.softtabstop = 0
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.copyindent = true
vim.opt_local.preserveindent = true

buffer_map(0, 'n', '<leader>ra', ':lua _G.tests.go.run_all()<CR>', { noremap = true, desc = 'all files' })
