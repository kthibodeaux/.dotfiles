local home = vim.env.HOME
local config = home .. '/.config/nvim'

vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.g.netrw_liststyle = 3
vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

vim.opt.signcolumn = 'yes'
vim.opt.autoindent = true
vim.opt.backspace = 'indent,start,eol'
vim.opt.backupcopy = 'yes'
vim.opt.colorcolumn = '80'
vim.opt.backupdir = config .. '/tmp//'
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
vim.opt.termguicolors = true
vim.opt.timeout = true
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 100
vim.opt.backupdir = config .. '/undodir//'
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.visualbell = true
vim.opt.wildmenu = true
vim.opt.winwidth = 90
vim.opt.wrap = false
vim.opt.mouse=

vim.api.nvim_exec([[
" Highlight current line in active pane only
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Highlight current column in active pane only
augroup CursorColumn
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
  au WinLeave * setlocal nocursorcolumn
augroup END
]], false)

vim.cmd('syntax enable')
vim.cmd('colorscheme OceanicNext')
vim.cmd('filetype indent plugin on')

require'keyboard_layouts'.use_colemak()
