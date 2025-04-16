local buffer_map = vim.api.nvim_buf_set_keymap

vim.opt_local.iskeyword:append("!")
vim.opt_local.iskeyword:append("?")

buffer_map(0, 'n', '<leader>.', ':lua require("open_alt").open()<CR>', { noremap = true, desc = 'open alt' })

buffer_map(0, 'n', '<leader>rr', ":lua _G.tests.rspec.run_nearest()<CR>", { noremap = true, desc = 'nearest test' })
buffer_map(0, 'n', '<leader>rf', ":lua _G.tests.rspec.run_file()<CR>", { noremap = true, desc = 'current file' })
buffer_map(0, 'n', '<leader>ra', ':lua _G.tests.rspec.run_all()<CR>', { noremap = true, desc = 'all files' })
buffer_map(0, 'n', '<leader>rl', ":lua _G.tests.run_last()<CR>", { noremap = true, desc = 'last test' })

vim.cmd('iabbr <buffer> pry ::Kernel.binding.pry')
