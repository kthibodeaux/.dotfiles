vim.opt_local.wrap = true
vim.opt_local.linebreak = true

local first_lines = vim.api.nvim_buf_get_lines(0, 0, 10, false)
for _, line in ipairs(first_lines) do
	if line:lower():match("<!--") and line:lower():match("generated") then
		vim.opt_local.modifiable = false
		vim.opt_local.readonly = true
		break
	end
end
