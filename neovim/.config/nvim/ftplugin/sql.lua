vim.api.nvim_create_autocmd("BufWritePre", {
	buffer = 0,
	callback = function()
		if vim.fn.filereadable(".sql-formatter.json") == 0 then
			return
		end
		local cursor = vim.api.nvim_win_get_cursor(0)
		local buf_lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
		local input = table.concat(buf_lines, "\n") .. "\n"
		local formatted = vim.fn.system("sql-formatter -c .sql-formatter.json", input)
		if vim.v.shell_error == 0 and formatted ~= "" then
			local lines = vim.fn.split(formatted, "\n")
			vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
		end
		pcall(vim.api.nvim_win_set_cursor, 0, cursor)
	end,
})
