local home = vim.env.HOME
local config = home .. '/.config/nvim'

vim.cmd("call plug#begin('" .. config .. "/plugged')")

vim.cmd("Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }")
vim.cmd("Plug 'junegunn/fzf.vim'")


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
