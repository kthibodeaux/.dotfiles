local function get_filename()
  local cwd = vim.fn.getcwd()
  local full_path = vim.fn.expand('%:p')
  local relative_path = full_path:gsub("^" .. cwd:gsub("[%^%$%(%)%%%.%[%]%*%+%-%?]", "%%%0") .. "/", "")

  return relative_path
end

local function remove_until(original_string, until_string)
  local start_position, end_position = original_string:find(until_string)

  if start_position then
    return original_string:sub(start_position)
  else
    return original_string
  end
end

local function get_line_number()
  local line, column = unpack(vim.api.nvim_win_get_cursor(0))
  return line
end

local go = {
  run_all = function()
    vim.cmd("VimuxRunCommand('go test ./...')")
  end,
  run_file = function()
    local filename = get_filename()

    if not filename:find("_test%.") then
      local dotIndex = filename:find("%.[^.]*$")

      if dotIndex then
        filename = filename:sub(1, dotIndex - 1) .. "_test" .. filename:sub(dotIndex)
      end
    end

    vim.cmd('VimuxRunCommand("go test ./' .. filename .. '")')
  end,
}

local rspec = {
  run_all = function()
    vim.cmd("VimuxRunCommand('bundle exec rspec')")
  end,
  run_file = function()
    local filename = remove_until(get_filename(), "spec")
    vim.cmd('VimuxRunCommand("bundle exec rspec ' .. filename .. '")')
  end,
  run_nearest = function()
    local filename = remove_until(get_filename(), "spec")
    vim.cmd('VimuxRunCommand("bundle exec rspec ' .. filename .. ':' .. get_line_number() .. '")')
  end,
}

local function run_last()
  vim.cmd("VimuxRunLastCommand")
end

return {
  go = go,
  rspec = rspec,
  run_last = run_last,
}
