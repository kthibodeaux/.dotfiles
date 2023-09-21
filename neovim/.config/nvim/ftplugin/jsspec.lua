local buffer_map = vim.api.nvim_buf_set_keymap

vim.opt_local.foldmethod = 'indent'
vim.opt_local.foldlevel = 2

buffer_map(0, 'n', '<leader>rf', ":call VimuxRunCommand('ya test' . vim.api.nvim_eval(expand('%')) . ' \n')<CR>", { noremap = true, desc = 'current file' })
buffer_map(0, 'n', '<leader>ra', ":call VimuxRunCommand('ya test\n", { noremap = true, desc = 'all files' })
