return {
  {
    'arborist-ts/arborist.nvim',
    config = function()
      require("arborist").setup({
        update_cadence = "weekly",
      })
    end,
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require('ts_context_commentstring').setup {}
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup({
        max_lines = 3,
      })
    end,
  },
}
