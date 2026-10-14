local function default_fqbn(root)
  local sketch = root .. '/sketch.yaml'
  if vim.fn.filereadable(sketch) == 1 then
    for _, line in ipairs(vim.fn.readfile(sketch)) do
      local fqbn = line:match('^default_fqbn:%s*(%S+)')
      if fqbn then
        return fqbn
      end
    end
  end
end

return {
  cmd = function(dispatchers, config)
    local cmd = {
      'arduino-language-server',
      '-cli', 'arduino-cli',
      '-cli-config', vim.fn.expand('~/.arduino15/arduino-cli.yaml'),
      '-clangd', 'clangd',
    }
    local fqbn = config.root_dir and default_fqbn(config.root_dir)
    if fqbn then
      vim.list_extend(cmd, { '-fqbn', fqbn })
    end
    return vim.lsp.rpc.start(cmd, dispatchers)
  end,
  filetypes = { 'arduino' },
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, function(name)
      return name:match('%.ino$') ~= nil
    end)
    if root then
      on_dir(root)
    end
  end,
  capabilities = {
    textDocument = {
      semanticTokens = vim.NIL,
    },
    workspace = {
      semanticTokens = vim.NIL,
    },
  },
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end,
}
