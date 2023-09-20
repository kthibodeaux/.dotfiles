local home = vim.env.HOME
local config = home .. '/.config/nvim'

vim.cmd("call plug#begin('" .. config .. "/plugged')")

vim.cmd("Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }")
vim.cmd("Plug 'junegunn/fzf.vim'")

vim.cmd("call plug#end()")
