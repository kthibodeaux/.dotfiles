return {
  {
    'kthibodeaux/tig.vim',
    keys = {
      { '<leader>gc', '<Plug>TigFileHistory', desc = 'file history' },
      { '<leader>gb', '<Plug>TigBlame', desc = 'blame' },
      { '<leader>gl', '<Plug>TigLatestCommitForLine', desc = 'latest commit for line' },
    },
  },
  {
    'wincent/vcs-jump',
    keys = {
      { '<leader>gd', ':VcsJump merge<CR>', desc = 'merge conflicts' },
    },
  },
}
