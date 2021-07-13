local map = vim.api.nvim_set_keymap
local options = { noremap = true }
local silent_options = { noremap = true, silent = true }

map('i', 'ii', '<Esc>', options)
map('i', 'jj', '<Esc>', options)
map('n', '<CR>', ':noh<CR><CR>', options) -- cancel search by pressing return
map('n', '<Down>', ':cnext<CR>', silent_options)
map('n', '<Left>', ':vertical resize +2<CR>', silent_options)
map('n', '<Right>', ':vertical resize -2<CR>', silent_options)
map('n', '<Up>', ':cprevious<CR>', silent_options)
map('n', '<leader><CR>', 'gt', options)
map('n', '<leader><tab>', 'mtgg=G`t', options) -- indent file, some filetype configs override to use coc
map('n', '<leader>fa', ':vs<CR>:Find <C-R><C-W><CR>', options)
map('n', '<leader>ff', ':Find<space>', options)
map('n', '<leader>fm', ':silent execute "!tmux split-window ranger " . expand(\'%:p:h\')<CR>', options)
map('n', '<leader>fv', ':vs<CR>:Find<space>', options)
map('n', '<leader>h', '<Plug>GitGoBack', options)
map('n', '<leader>lc', ":lua require'keyboard_layouts'.use_colemak()<CR>", options)
map('n', '<leader>lq', ":lua require'keyboard_layouts'.use_qwerty()<CR>", options)
map('n', '<leader>m', '<Plug>OpenDbMigrate', options)
map('n', '<leader>n', '<C-]>', silent_options)
map('n', '<leader>t', ':tab new<CR>', options)
map('n', '<leader>zx', '<C-w>=', options) -- equalize splits
map('n', '<leader>zz', '<C-w>z <C-w>_ <C-w>\\|', options) -- zoom in on a split
map('n', '<s-tab>', 'za', options) -- toggle fold
map('n', 'N', 'Nzz', options)
map('n', 'S', 'i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>$', options) -- split line
map('n', 'n', 'nzz', options)
