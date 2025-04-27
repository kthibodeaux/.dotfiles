return {
  {
    'chrisbra/Recover.vim',
  },
  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('oil').setup({
        view_options = {
          show_hidden = true,
        },
        keymaps = {
          ["<C-l>"] = false,
          ["<C-h>"] = false,
        },
      })
    end,
    lazy = false,
    opts = {},
    keys = {
      { '<leader>s', "<cmd>Oil<CR>", desc = 'open parent dir' },
    },
  }
}
