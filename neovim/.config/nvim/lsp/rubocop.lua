return {
  cmd = function(dispatchers, config)
    local root = config.root_dir
    local cmd = { 'rubocop', '--lsp' }
    -- use the project's locked version if it exists
    local lock = root and root .. '/Gemfile.lock'
    if lock and vim.fn.filereadable(lock) == 1 then
      for _, line in ipairs(vim.fn.readfile(lock)) do
        if line:match('^.*rubocop %(') then
          cmd = { 'bundle', 'exec', 'rubocop', '--lsp' }
          break
        end
      end
    end
    return vim.lsp.rpc.start(require('ruby_cmd')(root, cmd), dispatchers, { cwd = root })
  end,
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
