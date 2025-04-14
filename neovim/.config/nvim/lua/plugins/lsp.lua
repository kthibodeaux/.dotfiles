return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },

  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
  }
}
