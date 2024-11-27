local function get_filename()
  local cwd = vim.fn.getcwd()
  local full_path = vim.fn.expand('%:p')
  local relative_path = full_path:gsub("^" .. cwd:gsub("[%^%$%(%)%%%.%[%]%*%+%-%?]", "%%%0") .. "/", "")

  return relative_path
end

local function get_line_number()
  local line, column = unpack(vim.api.nvim_win_get_cursor(0))
  return line
end

local function line_history()
  vim.cmd("silent! !tmux split-window -h 'git log -L " .. get_line_number() .. "," .. get_line_number() .. ":" .. get_filename() .. "; read'")
end

return {
  line_history = line_history,
}
