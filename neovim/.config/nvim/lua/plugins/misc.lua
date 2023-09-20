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
    'junegunn/vim-peekaboo',
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
}
