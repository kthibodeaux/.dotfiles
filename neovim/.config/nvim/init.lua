-- Leaders must be set before plugins are loaded
require('init/settings')

--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local fs_stat
if vim.fn.has('nvim-0.10.0') == 1 then
  fs_stat = vim.uv.fs_stat
else
  -- Deprecated in 0.10+
  fs_stat = vim.loop.fs_stat
end

if not fs_stat(lazypath) then
  vim.notify('Installing lazy...')

  local result = vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })

  if vim.v.shell_error ~= 0 then
    print('ERROR: ' .. result)
  end
end

vim.opt.runtimepath:prepend(lazypath)

_G.tests = require('tests')

require('lazy').setup('plugins')

require('init/maps')
require('init/lsp')
