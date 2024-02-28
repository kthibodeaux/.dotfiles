return {
  {
    'sebdah/vim-delve',
    keys = {
      { '<leader>db', '<cmd> DlvToggleBreakpoint<CR>', desc = 'toggle breakpoint', ft='go' },
      { '<leader>dt', '<cmd> DlvToggleTracepoint<CR>', desc = 'toggle tracepoint', ft='go' },
      { '<leader>dd', '<cmd> DlvDebug<CR>', desc = 'debug', ft='go' },
      { '<leader>dr', '<cmd> DlvTest<CR>', desc = 'test', ft='go' },
    },
  },
}
