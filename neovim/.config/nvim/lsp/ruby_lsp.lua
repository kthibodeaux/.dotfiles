return {
  cmd = vim.env.NVIM_CONTAINER
    and { 'bash', '-c', 'source /usr/share/chruby/chruby.sh && chruby "$(cat .ruby-version 2>/dev/null || ls ~/.rubies | sort -V | tail -1)" && ruby-lsp' }
    or { 'zsh', '-l', '-c', 'source ~/.zsh/functions/chruby_auto.sh && chruby_auto && ruby-lsp' },
  filetypes = { 'ruby' },
  root_markers = { 'Gemfile', '.git' },
  init_options = {
    formatter = "auto",
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
  end,
}
