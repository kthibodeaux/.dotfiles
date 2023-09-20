local home = vim.env.HOME
local config = home .. '/.config/nvim'

vim.cmd("call plug#begin('" .. config .. "/plugged')")

vim.cmd("Plug 'nvim-neorg/neorg' | Plug 'nvim-lua/plenary.nvim'")

vim.cmd("Plug 'ap/vim-css-color'")
vim.cmd("Plug 'AndrewRadev/splitjoin.vim'")
vim.cmd("Plug 'FooSoft/vim-argwrap'")
vim.cmd("Plug 'Konfekt/FastFold'")
vim.cmd("Plug 'chrisbra/Recover.vim'")
vim.cmd("Plug 'danro/rename.vim'")
vim.cmd("Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }")
vim.cmd("Plug 'junegunn/fzf.vim'")
vim.cmd("Plug 'junegunn/vim-peekaboo'")
vim.cmd("Plug 'kthibodeaux/tig.vim'")
vim.cmd("Plug 'mbbill/undotree'")
vim.cmd("Plug 'JoosepAlviste/nvim-ts-context-commentstring'")
vim.cmd("Plug 'tpope/vim-commentary'")
vim.cmd("Plug 'tpope/vim-surround'")
vim.cmd("Plug 'tpope/vim-vinegar'")
vim.cmd("Plug 'tpope/vim-abolish'")
vim.cmd("Plug 'unblevable/quick-scope'")
vim.cmd("Plug 'wincent/vcs-jump'")

-- LSP Support
vim.cmd("Plug 'neovim/nvim-lspconfig'")             -- Required
vim.cmd("Plug 'williamboman/mason.nvim'")           -- Optional
vim.cmd("Plug 'williamboman/mason-lspconfig.nvim'") -- Optional

-- Autocompletion Engine
vim.cmd("Plug 'hrsh7th/nvim-cmp'")         -- Required
vim.cmd("Plug 'hrsh7th/cmp-nvim-lsp'")     -- Required
vim.cmd("Plug 'hrsh7th/cmp-buffer'")       -- Optional
vim.cmd("Plug 'hrsh7th/cmp-path'")         -- Optional
vim.cmd("Plug 'saadparwaiz1/cmp_luasnip'") -- Optional
vim.cmd("Plug 'hrsh7th/cmp-nvim-lua'")     -- Optional

--  Snippets
vim.cmd("Plug 'L3MON4D3/LuaSnip'")             -- Required
-- vim.cmd("Plug 'rafamadriz/friendly-snippets'") -- Optional

vim.cmd("Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v1.x'}")

vim.cmd("call plug#end()")

require('ts_context_commentstring').setup {}
