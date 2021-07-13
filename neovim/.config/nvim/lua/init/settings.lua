vim.g.solarized_use16 = 1
vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.g.netrw_liststyle = 3
vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

vim.opt.autoindent = true
vim.opt.background = 'dark'
vim.opt.backspace = 'indent,start,eol'
vim.opt.backupcopy = 'yes'
vim.opt.backupdir = '~/.config/nvim/tmp'
vim.opt.colorcolumn = '80'
vim.opt.directory = '~/.config/nvim/tmp'
vim.opt.encoding = 'utf-8'
vim.opt.expandtab = true
vim.opt.fileencoding = 'utf-8'
vim.opt.foldlevelstart = 3
vim.opt.foldmethod = 'syntax'
vim.opt.gdefault = true
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.number = true
vim.opt.path = '.,app/javascript/**,frontend/src/**,src/**'
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.scrolloff = 3
vim.opt.shiftwidth = 2
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.suffixesadd = '.vue'
vim.opt.tabstop = 2
vim.opt.timeout = true
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 100
vim.opt.undodir = '~/.config/nvim/undodir'
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.visualbell = true
vim.opt.wildmenu = true
vim.opt.winwidth = 90
vim.opt.wrap = false

vim.cmd('colorscheme solarized8')
vim.cmd('filetype indent plugin on')
vim.cmd('syntax on')

require'keyboard_layouts'.use_colemak()
