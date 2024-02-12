return {
  {
    'chrisbra/Recover.vim',
  },
  {
    'danro/rename.vim',
  },
  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('oil').setup({
        view_options = {
          show_hidden = true,
        },
      })
    end,
    lazy = false,
    opts = {},
    keys = {
      { '-', "<cmd>Oil<CR>", desc = 'open parent dir' },
    },
  }
}
