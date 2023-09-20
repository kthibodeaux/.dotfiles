return {
  'nvim-telescope/telescope.nvim', tag = '0.1.3',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ['<esc>'] = 'close',
          },
        },
      },
    })
  end,
  keys = {
    { '<leader>e', "<cmd>lua require('telescope.builtin').find_files()<cr>" },
    { '<leader>ff', "<cmd>lua require('telescope.builtin').live_grep()<cr>" },
  },
}
