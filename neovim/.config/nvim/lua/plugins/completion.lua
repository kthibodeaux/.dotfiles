return {
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
      keymap = { preset = 'enter' },
      completion = { documentation = { auto_show = true } },
      sources = {
        default = { 'snippets', 'lsp', 'path', 'buffer' },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      signature = { enabled = true }
    },
    opts_extend = { "sources.default" },
  },
}
