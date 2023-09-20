return {
  'nvim-telescope/telescope.nvim', tag = '0.1.3',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    require('telescope').setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--hidden",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
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
    { '<leader>e', "<cmd>lua require('telescope.builtin').git_files()<cr>", desc = 'find file' },
    { '<leader>ff', "<cmd>lua require('telescope.builtin').grep_string({use_regex = true, search = vim.fn.input('Grep For > ')})<cr>", desc = 'grep' },
    { '<leader>fa', "<cmd>lua require('telescope.builtin').grep_string()<cr>", desc = 'grep current word' },
  },
}
