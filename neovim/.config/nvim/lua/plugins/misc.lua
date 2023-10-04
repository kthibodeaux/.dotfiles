return {
  {
    'ap/vim-css-color',
  },
  {
    'AndrewRadev/splitjoin.vim',
  },
  {
    'FooSoft/vim-argwrap',
    config = function()
      vim.g.argwrap_padded_braces = '{'
    end,
    keys = {
      { '<leader>a', ':ArgWrap<CR>', desc = 'arg wrap' },
    },
  },
  {
    'Konfekt/FastFold',
  },
  {
    'mbbill/undotree',
    keys = {
      { '<F5>', ':UndotreeToggle<CR>', desc = 'undo tree' },
    }
  },
  {
    'tpope/vim-surround',
  },
  {
    'tpope/vim-abolish',
  },
  {
    'unblevable/quick-scope',
  },
  {
    'echasnovski/mini.indentscope',
    version = '*',
    config = function()
      require('mini.indentscope').setup({
        draw = {
          delay = 100,
          animation = require('mini.indentscope').gen_animation.none(),
          priority = 2,
        },
      })
    end,
  },
  {
    "ashfinal/qfview.nvim",
    event = "UIEnter",
    config = true,
  },
}
