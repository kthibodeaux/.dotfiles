-- vim:foldmethod=marker
-- Leaders must be set before plugins are loaded
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- {{{ Install package manager
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
-- }}}

require('lazy').setup('plugins')

require('init/plugins')
require('init/settings')
require('init/abbr')
require('init/maps')
require('init/statusline')
require('init/commands')
require('init/treesitter')

require('init/plugin_config/fzf')
require('init/plugin_config/lsp')
require('init/plugin_config/neorg')
require('init/plugin_config/tig')
require('init/plugin_config/undotree')
require('init/plugin_config/vcs-jump')
require('init/plugin_config/vim-argwrap')
require('init/plugin_config/vim-rspec')
require('init/plugin_config/vim-ruby')
require('init/plugin_config/vim-tmux-navigator')
