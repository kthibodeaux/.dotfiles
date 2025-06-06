local home = vim.env.HOME
local config = home .. '/.config/nvim'

vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.g.netrw_liststyle = 3
vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

vim.opt.signcolumn = 'yes'
vim.opt.backspace = 'indent,start,eol'
vim.opt.backupcopy = 'yes'
vim.opt.backupdir = config .. '/tmp//'
vim.opt.encoding = 'utf-8'
vim.opt.expandtab = true
vim.opt.fileencoding = 'utf-8'
vim.opt.foldlevelstart = 10
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.gdefault = true
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.path = '.,app/javascript/**,frontend/src/**,src/**'
vim.opt.relativenumber = true
vim.opt.scrolloff = 3
vim.opt.shiftwidth = 2
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.suffixesadd = '.vue'
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.ttimeoutlen = 100
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.visualbell = true
vim.opt.winwidth = 90
vim.opt.wrap = false
vim.opt.mouse = ''
vim.opt.exrc = true
vim.opt.winborder = 'double'
