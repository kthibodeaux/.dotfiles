local map = vim.api.nvim_set_keymap
local options = { noremap = true }
local silent_options = { noremap = true, silent = true }

map('n', '<CR>', ':noh<CR><CR>', options) -- cancel search by pressing return
map('n', '<Down>', ':cnext<CR>', silent_options)
map('n', '<Left>', ':vertical resize +2<CR>', silent_options)
map('n', '<Right>', ':vertical resize -2<CR>', silent_options)
map('n', '<Up>', ':cprevious<CR>', silent_options)
map('n', '<leader><CR>', 'gt', { noremap = true, desc = 'next tab' })
map('n', '<leader>fr', ':Rename ', { noremap = true, desc = 'rename' })
map('n', '<leader>gh', '<Plug>GitGoBack', { noremap = true, desc = 'history' })
map('n', '<leader>fm', '<Plug>OpenDbMigrate', { noremap = true, desc = 'migrations' })
map('n', '<leader><tab>', ':tab new<CR>', { noremap = true, desc = 'new tab' })
map('n', '<leader>fz', ':tabnew %<CR>', { noremap = true, desc = 'zoom split' })
map('n', '<s-tab>', 'za', options) -- toggle fold
map('n', 'N', 'Nzz', options)
map('n', 'S', 'i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>$', options) -- split line
map('n', 'n', 'nzz', options)
map('n', '<leader>ws', ':e ~/wikis/work/standup.md<CR>', { desc = 'standup notes' })
map('n', '<leader>ww', ':e ~/wikis/work/weekly.md<CR>', { desc = 'weekly sync notes' })
map('i', 'hh', '<ESC>', silent_options)

map('n', '<leader>gl', ":lua require('git').line_history()<CR>", { noremap = true, desc = 'line history' })
