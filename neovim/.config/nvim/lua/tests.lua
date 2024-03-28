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
    local filename = vim.fn.expand('%')
    vim.cmd('VimuxRunCommand("bundle exec rspec ' .. filename .. '")')
  end,
  run_nearest = function()
    local filename = vim.fn.expand('%')
    local line, column = unpack(vim.api.nvim_win_get_cursor(0))

    vim.cmd('VimuxRunCommand("bundle exec rspec ' .. filename .. ':' .. line .. '")')
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
