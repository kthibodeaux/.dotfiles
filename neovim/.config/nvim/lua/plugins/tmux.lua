return {
  {
    'benmills/vimux',
  },
  {
    'christoomey/vim-tmux-navigator',
    config = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
  },
}
