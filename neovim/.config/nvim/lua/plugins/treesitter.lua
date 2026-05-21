return {
  {
    'arborist-ts/arborist.nvim',
    config = function()
      require("arborist").setup({
        update_cadence = "weekly",
      })
    end,
  },
}
