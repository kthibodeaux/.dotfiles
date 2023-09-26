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
    opts = {},
    keys = {
      { '-', "<cmd>Oil<CR>", desc = 'open parent dir' },
    },
  }
}
