return {
  cmd = vim.env.NVIM_CONTAINER
    and { 'bash', '-c', 'source /usr/share/chruby/chruby.sh && chruby "$(cat .ruby-version 2>/dev/null || ls ~/.rubies | sort -V | tail -1)" && rubocop --lsp' }
    or { 'zsh', '-l', '-c', 'source ~/.zsh/functions/chruby_auto.sh && chruby_auto && rubocop --lsp' },
  filetypes = { 'ruby' },
  root_markers = { 'Gemfile', '.git' },
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end,
}
