local function find_config(start_dir)
	local dir = start_dir
	while true do
		local config = dir .. "/.sql-formatter.json"
		if vim.fn.filereadable(config) == 1 then
			return config
		end
		if vim.fn.isdirectory(dir .. "/.git") == 1 then
			return nil
		end
		local parent = vim.fn.fnamemodify(dir, ":h")
		if parent == dir then
			return nil
		end
		dir = parent
	end
end

vim.api.nvim_create_autocmd("BufWritePre", {
	buffer = 0,
	callback = function()
		local file_dir = vim.fn.expand("%:p:h")
		local config = find_config(file_dir)
		if not config then
			return
		end
		local cursor = vim.api.nvim_win_get_cursor(0)
		local buf_lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
		local input = table.concat(buf_lines, "\n") .. "\n"
		local formatted = vim.fn.system("sql-formatter -c " .. vim.fn.shellescape(config), input)
		if vim.v.shell_error == 0 and formatted ~= "" then
			local lines = vim.fn.split(formatted, "\n")
			vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
		end
		pcall(vim.api.nvim_win_set_cursor, 0, cursor)
	end,
})
