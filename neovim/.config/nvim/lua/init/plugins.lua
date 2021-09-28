local home = vim.env.HOME
local config = home .. '/.config/nvim'

vim.cmd("call plug#begin('" .. config .. "/plugged')")

vim.cmd("Plug 'overcache/NeoSolarized'")
vim.cmd("Plug 'mhartington/oceanic-next'")

vim.cmd("Plug 'benmills/vimux'")
vim.cmd("Plug 'christoomey/vim-tmux-navigator'")

vim.cmd("Plug 'neoclide/coc.nvim', {'branch': 'release'}")

vim.cmd("Plug 'thoughtbot/vim-rspec'")
vim.cmd("Plug 'tpope/vim-endwise'")
vim.cmd("Plug 'tpope/vim-rails'")
vim.cmd("Plug 'vim-ruby/vim-ruby'")
vim.cmd("Plug 'slim-template/vim-slim'")

vim.cmd("Plug 'digitaltoad/vim-pug'")
vim.cmd("Plug 'joaohkfaria/vim-jest-snippets'")
vim.cmd("Plug 'kchmck/vim-coffee-script'")
vim.cmd("Plug 'pangloss/vim-javascript'")
vim.cmd("Plug 'posva/vim-vue'")
vim.cmd("Plug 'mustache/vim-mustache-handlebars'")
vim.cmd("Plug 'joukevandermaas/vim-ember-hbs'")

vim.cmd("Plug 'AndrewRadev/splitjoin.vim'")
vim.cmd("Plug 'FooSoft/vim-argwrap'")
vim.cmd("Plug 'Konfekt/FastFold'")
vim.cmd("Plug 'ap/vim-css-color'")
vim.cmd("Plug 'chrisbra/Recover.vim'")
vim.cmd("Plug 'danro/rename.vim'")
vim.cmd("Plug 'jiangmiao/auto-pairs'")
vim.cmd("Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }")
vim.cmd("Plug 'junegunn/fzf.vim'")
vim.cmd("Plug 'junegunn/vim-peekaboo'")
vim.cmd("Plug 'kana/vim-textobj-user'")
vim.cmd("Plug 'kthibodeaux/tig.vim'")
vim.cmd("Plug 'mbbill/undotree'")
vim.cmd("Plug 'powerman/vim-plugin-AnsiEsc'")
vim.cmd("Plug 'rhysd/vim-textobj-ruby'")
vim.cmd("Plug 'sgeb/vim-diff-fold'")
vim.cmd("Plug 'tpope/vim-commentary'")
vim.cmd("Plug 'tpope/vim-surround'")
vim.cmd("Plug 'tpope/vim-vinegar'")
vim.cmd("Plug 'unblevable/quick-scope'")
vim.cmd("Plug 'wincent/vcs-jump'")

vim.cmd("call plug#end()")
