local map = vim.api.nvim_set_keymap
local options = { noremap = true }
local silent_options = { noremap = true, silent = true }

map('n', '<CR>', ':noh<CR><CR>', options) -- cancel search by pressing return
map('n', '<Down>', ':cnext<CR>', silent_options)
map('n', '<Left>', ':vertical resize +2<CR>', silent_options)
map('n', '<Right>', ':vertical resize -2<CR>', silent_options)
map('n', '<Up>', ':cprevious<CR>', silent_options)
map('n', '<leader><CR>', 'gt', options)
map('n', '<leader><tab>', 'mtgg=G`t', options) -- indent file, some filetype configs override
map('n', '<leader>fa', ':vs<CR>:Find <C-R><C-W><CR>', options)
map('n', '<leader>ff', ':Find<space>', options)
map('n', '<leader>fm', ':silent execute "!tmux split-window ranger " . expand(\'%:p:h\')<CR>', options)
map('n', '<leader>fv', ':vs<CR>:Find<space>', options)
map('n', '<leader>h', '<Plug>GitGoBack', options)
map('n', '<leader>n', '<C-]>', silent_options)
map('n', '<leader>t', ':tab new<CR>', options)
map('n', '<leader>zz', ':tabnew %<CR>', options)
map('n', '<s-tab>', 'za', options) -- toggle fold
map('n', 'N', 'Nzz', options)
map('n', 'S', 'i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>$', options) -- split line
map('n', 'n', 'nzz', options)

map('n', '<C-h>', ':TmuxNavigateLeft<CR>', options)
map('n', '<C-j>', ':TmuxNavigateDown<CR>', options)
map('n', '<C-k>', ':TmuxNavigateUp<CR>', options)
map('n', '<C-l>', ':TmuxNavigateRight<CR>', options)
