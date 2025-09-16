local function get_line_content(n)
  local l = vim.api.nvim_buf_get_lines(0, n - 1, n, false)
  return l[1] or ""
end

local function get_line_number()
  local line, _ = unpack(vim.api.nvim_win_get_cursor(0))
  return line
end

local function get_filename()
  local cwd = vim.fn.getcwd()
  local full_path = vim.fn.expand('%:p')
  local relative_path = full_path:gsub("^" .. cwd:gsub("[%^%$%(%)%%%.%[%]%*%+%-%?]", "%%%0") .. "/", "")

  return relative_path
end

local function ensure_spec(filename)
  if filename:find("spec", 1, true) then
    return filename
  else
    return require('open_alt').get_alternate_filename(filename)
  end
end

local function remove_until(original_string, until_string)
  local start_position, _ = original_string:find(until_string)

  if start_position then
    return original_string:sub(start_position)
  else
    return original_string
  end
end

local function find_go_test_name()
  local cur_line = get_line_number()
  local line_text = get_line_content(cur_line)
  local on_name = line_text:match("^%s*func%s+(Test[%w_]+)%s*%(")
  if on_name then
    return on_name
  end

  for line_number = cur_line, 1, -1 do
    local txt = get_line_content(line_number)
    local name = txt:match("^%s*func%s+(Test[%w_]+)%s*%(")
    if name then
      return name
    end
  end

  return nil
end

local go = {
  run_all = function()
    vim.cmd("VimuxRunCommand('go test ./...')")
  end,
  run_file = function()
    local filename = get_filename()

    local directory = filename:match("(.*/)")
    if not directory then
      directory = "..."
    elseif directory ~= "./" then
      directory = directory:sub(1, #directory - 1)
    end

    vim.cmd('VimuxRunCommand("go test -v ./' .. directory .. '")')
  end,
  run_nearest = function()
    local filename = get_filename()

    local directory = filename:match("(.*/)")
    if not directory then
      directory = "..."
    elseif directory ~= "./" then
      directory = directory:sub(1, #directory - 1)
    end

    local test_name = find_go_test_name()

    if test_name then
      vim.cmd('VimuxRunCommand("go test -v ./' .. directory .. ' -run ' .. test_name .. '")')
    else
      vim.cmd('VimuxRunCommand("go test -v ./' .. directory .. '")')
    end
  end,
}

local js = {
  run_all = function()
    vim.cmd("VimuxRunCommand('yarn test')")
  end,
  run_file = function()
    local filename = get_filename()
    vim.cmd('VimuxRunCommand("yarn test ./' .. filename .. '")')
  end,
}

local rspec = {
  run_all = function()
    vim.cmd("VimuxRunCommand('bundle exec rspec')")
  end,
  run_file = function()
    local filename = remove_until(ensure_spec(get_filename()), "spec")
    vim.cmd('VimuxRunCommand("bundle exec rspec -f doc ./' .. filename .. '")')
  end,
  run_nearest = function()
    local filename = remove_until(ensure_spec(get_filename()), "spec")
    vim.cmd('VimuxRunCommand("bundle exec rspec -f doc ./' .. filename .. ':' .. get_line_number() .. '")')
  end,
}

local function run_last()
  vim.cmd("VimuxRunLastCommand")
end

return {
  go = go,
  js = js,
  rspec = rspec,
  run_last = run_last,
}
