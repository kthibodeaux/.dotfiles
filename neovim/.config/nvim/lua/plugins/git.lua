return {
  {
    'kthibodeaux/tig.vim',
    keys = {
      { '<leader>c', '<Plug>TigFileHistory' },
      { '<leader>b', '<Plug>TigBlame' },
      { '<leader>y', '<Plug>TigLatestCommitForLine' },
    },
  },
  {
    'wincent/vcs-jump',
    keys = {
      { '<leader>d', ':VcsJump merge<CR>' },
    },
  },
}
