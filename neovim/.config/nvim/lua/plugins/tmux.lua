return {
  {
    'christoomey/vim-tmux-navigator',
    config = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
    keys = {
      { '<C-h>', ':TmuxNavigateLeft<CR>', desc = 'move focus left' },
      { '<C-j>', ':TmuxNavigateDown<CR>', desc = 'move focus down' },
      { '<C-k>', ':TmuxNavigateUp<CR>', desc = 'move focus up' },
      { '<C-l>', ':TmuxNavigateRight<CR>', desc = 'move focus right' },
    }
  },
}
