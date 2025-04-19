return {
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      'fang2hou/blink-copilot'
    },
    version = '1.*',
    opts = {
      keymap = { preset = 'enter' },
      completion = { documentation = { auto_show = true } },
      sources = {
        default = { 'snippets', 'lsp', 'path', 'buffer', 'copilot' },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      signature = { enabled = true }
    },
    opts_extend = { "sources.default" },
  },
}
