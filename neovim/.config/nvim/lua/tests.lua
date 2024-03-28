local function go_run_all()
  vim.cmd("VimuxRunCommand('go test ./...')")
end

local function rspec_run_all()
  vim.cmd("VimuxRunCommand('bundle exec rspec')")
end

local function rspec_run_file()
  local filename = vim.fn.expand('%')
  vim.cmd('VimuxRunCommand("bundle exec rspec ' .. filename .. '")')
end

local function rspec_run_nearest()
  local filename = vim.fn.expand('%')
  local line, column = unpack(vim.api.nvim_win_get_cursor(0))

  vim.cmd('VimuxRunCommand("bundle exec rspec ' .. filename .. ':' .. line .. '")')
end

local function run_last()
  vim.cmd("VimuxRunLastCommand")
end

return {
  go_run_all = go_run_all,
  rspec_run_all = rspec_run_all,
  rspec_run_file = rspec_run_file,
  rspec_run_nearest = rspec_run_nearest,
  run_last = run_last,
}
