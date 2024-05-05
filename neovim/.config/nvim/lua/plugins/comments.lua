return {
  {
    'numToStr/Comment.nvim',
    lazy = false,
    config = function()
      require('Comment').setup()
    end,
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
}
