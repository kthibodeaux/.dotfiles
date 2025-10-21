local buffer_map = vim.api.nvim_buf_set_keymap

vim.opt_local.expandtab = false
vim.opt_local.softtabstop = 0
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.copyindent = true
vim.opt_local.preserveindent = true

buffer_map(0, 'n', '<leader>rr', ":lua _G.tests.go.run_nearest()<CR>", { noremap = true, desc = 'nearest test' })
buffer_map(0, 'n', '<leader>rf', ":lua _G.tests.go.run_file()<CR>", { noremap = true, desc = 'current file' })
buffer_map(0, 'n', '<leader>ra', ':lua _G.tests.go.run_all()<CR>', { noremap = true, desc = 'all files' })
buffer_map(0, 'n', '<leader>rl', ":lua _G.tests.run_last()<CR>", { noremap = true, desc = 'last test' })

buffer_map(0, 'n', '<leader>.', ':lua require("open_alt").open()<CR>', { noremap = true, desc = 'open alt' })

local first_lines = vim.api.nvim_buf_get_lines(0, 0, 10, false)
for _, line in ipairs(first_lines) do
	if line:lower():match("code generated") then
		vim.opt_local.modifiable = false
		vim.opt_local.readonly = true
		break
	end
end
