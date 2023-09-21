local buffer_map = vim.api.nvim_buf_set_keymap

vim.opt_local.iskeyword:append("!")
vim.opt_local.iskeyword:append("?")

buffer_map(0, 'n', '<localleader>c', ":Econtroller<CR>", { noremap = true, desc = 'open controller' })
buffer_map(0, 'n', '<localleader>m', ":Emodel<CR>", { noremap = true, desc = 'open model' })
buffer_map(0, 'n', '<localleader>v', ":Eview<CR>", { noremap = true, desc = 'open view' })

buffer_map(0, 'n', '<leader>.', "<Plug>RailsOpenAlt", { noremap = true, desc = 'open alt' })

buffer_map(0, 'n', '<leader>rr', ":call RunNearestSpec()<CR>", { noremap = true, desc = 'nearest spec' })
buffer_map(0, 'n', '<leader>rf', ":call RunCurrentSpecFile()<CR>", { noremap = true, desc = 'current file' })
buffer_map(0, 'n', '<leader>rl', ":call RunLastSpec()<CR>", { noremap = true, desc = 'last spec' })
buffer_map(0, 'n', '<leader>ra', ":call RunAllSpecs()<CR>", { noremap = true, desc = 'all files' })
