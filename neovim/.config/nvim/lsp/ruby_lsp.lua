return {
  cmd = function(dispatchers, config)
    local root = config.root_dir
    local cmd = { 'ruby-lsp' }
    -- use the project's locked version if it exists
    local lock = root and root .. '/Gemfile.lock'
    if lock and vim.fn.filereadable(lock) == 1 then
      for _, line in ipairs(vim.fn.readfile(lock)) do
        if line:match('^.*ruby-lsp %(') then
          cmd = { 'bundle', 'exec', 'ruby-lsp' }
          break
        end
      end
    end
    return vim.lsp.rpc.start(require('ruby_cmd')(root, cmd), dispatchers, { cwd = root })
  end,
  filetypes = { 'ruby' },
  root_markers = { 'Gemfile', '.git' },
  init_options = {
    formatter = "auto",
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
  end,
}
