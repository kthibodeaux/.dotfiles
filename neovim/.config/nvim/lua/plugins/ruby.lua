return {
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
    'rhysd/vim-textobj-ruby',
    dependencies = {
      'kana/vim-textobj-user'
    },
  },
}
