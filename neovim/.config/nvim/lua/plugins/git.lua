return {
  {
    'kthibodeaux/tig.vim',
    keys = {
      { '<leader>gc', '<Plug>TigFileHistory', desc = 'file history' },
      { '<leader>gb', '<Plug>TigBlame', desc = 'blame' },
      { '<leader>gn', '<Plug>TigLatestCommitForLine', desc = 'latest commit for line' },
    },
  },
  {
    'wincent/vcs-jump',
    keys = {
      { '<leader>gm', ':VcsJump merge<CR>', desc = 'merge conflicts' },
    },
  },
  {
    'rhysd/committia.vim',
  },
  {
    'sindrets/diffview.nvim',
    keys = {
      { '<leader>gd', ':DiffviewOpen<CR>', desc = 'diff view' },
    },
  },
}
