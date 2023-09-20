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
        layout_strategy = "flex",
        layout_config = {
          preview_cutoff = 10,
          width = 0.8,
          height = 0.9,
          flex = {
            flip_columns = 170,
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
