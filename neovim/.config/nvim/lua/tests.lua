local function get_filename()
  local filename = vim.fn.expand('%')
  return filename
end

local function get_line_number()
  local line, column = unpack(vim.api.nvim_win_get_cursor(0))
  return line
end

local go = {
  run_all = function()
    vim.cmd("VimuxRunCommand('go test ./...')")
  end,
}

local rspec = {
  run_all = function()
    vim.cmd("VimuxRunCommand('bundle exec rspec')")
  end,
  run_file = function()
    vim.cmd('VimuxRunCommand("bundle exec rspec ' .. get_filename() .. '")')
  end,
  run_nearest = function()
    vim.cmd('VimuxRunCommand("bundle exec rspec ' .. get_filename() .. ':' .. get_line_number() .. '")')
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
