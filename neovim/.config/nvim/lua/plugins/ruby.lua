return {
  {
    'thoughtbot/vim-rspec',
    config = function()
      vim.g.rspec_command = 'call VimuxRunCommand("bes {spec}\n")'
    end,
  },
  {
    'RRethy/nvim-treesitter-endwise',
    config = function()
      require('nvim-treesitter.configs').setup {
        endwise = {
          enable = true,
        },
      }
    end
  },
  {
    'tpope/vim-rails',
    lazy = true,
    ft = 'ruby',
  },
  {
    'rhysd/vim-textobj-ruby',
    dependencies = {
      'kana/vim-textobj-user'
    },
  },
}
