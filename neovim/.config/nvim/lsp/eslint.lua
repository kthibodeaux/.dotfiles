local eslint_config_files = {
  '.eslintrc',
  '.eslintrc.js',
  '.eslintrc.cjs',
  '.eslintrc.yaml',
  '.eslintrc.yml',
  '.eslintrc.json',
  'eslint.config.js',
  'eslint.config.mjs',
  'eslint.config.cjs',
  'eslint.config.ts',
  'eslint.config.mts',
  'eslint.config.cts',
}

return {
  cmd = function(dispatchers, config)
    local cmd = 'vscode-eslint-language-server'
    if (config or {}).root_dir then
      local local_cmd = vim.fs.joinpath(config.root_dir, 'node_modules/.bin', cmd)
      if vim.fn.executable(local_cmd) == 1 then
        cmd = local_cmd
      end
    end
    return vim.lsp.rpc.start({ cmd, '--stdio' }, dispatchers)
  end,
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'vue',
  },
  workspace_required = true,
  root_dir = function(bufnr, on_dir)
    if vim.fs.root(bufnr, { 'deno.json', 'deno.jsonc', 'deno.lock' }) then
      return
    end

    local project_root = vim.fs.root(bufnr, { { 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb', 'bun.lock' }, { '.git' } })
      or vim.fn.getcwd()

    -- only start when an eslint config exists above the buffer
    local filename = vim.api.nvim_buf_get_name(bufnr)
    local config = vim.fs.find(eslint_config_files, {
      path = filename,
      type = 'file',
      limit = 1,
      upward = true,
      stop = vim.fs.dirname(project_root),
    })[1]
    if config then
      on_dir(project_root)
    end
  end,
  settings = {
    validate = 'on',
    useESLintClass = false,
    experimental = {},
    codeActionOnSave = { enable = false, mode = 'all' },
    format = true,
    quiet = false,
    onIgnoredFiles = 'off',
    rulesCustomizations = {},
    run = 'onType',
    problems = { shortenToSingleLine = false },
    nodePath = '',
    workingDirectory = { mode = 'auto' },
    codeAction = {
      disableRuleComment = { enable = true, location = 'separateLine' },
      showDocumentation = { enable = true },
    },
  },
  before_init = function(_, config)
    local root_dir = config.root_dir
    if root_dir then
      config.settings = config.settings or {}
      config.settings.workspaceFolder = {
        uri = vim.uri_from_fname(root_dir),
        name = vim.fn.fnamemodify(root_dir, ':t'),
      }

      -- Yarn PnP projects
      if type(config.cmd) == 'table' and (vim.uv.fs_stat(root_dir .. '/.pnp.cjs') or vim.uv.fs_stat(root_dir .. '/.pnp.js')) then
        config.cmd = vim.list_extend({ 'yarn', 'exec' }, config.cmd)
      end
    end
  end,
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, 'LspEslintFixAll', function()
      client:request_sync('workspace/executeCommand', {
        command = 'eslint.applyAllFixes',
        arguments = {
          {
            uri = vim.uri_from_bufnr(bufnr),
            version = vim.lsp.util.buf_versions[bufnr],
          },
        },
      }, nil, bufnr)
    end, {})

    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "LspEslintFixAll",
    })
  end,
  handlers = {
    ['eslint/openDoc'] = function(_, result)
      if result then
        vim.ui.open(result.url)
      end
      return {}
    end,
    ['eslint/confirmESLintExecution'] = function(_, result)
      if not result then
        return
      end
      return 4 -- approved
    end,
    ['eslint/probeFailed'] = function()
      vim.notify('ESLint probe failed.', vim.log.levels.WARN)
      return {}
    end,
    ['eslint/noLibrary'] = function()
      vim.notify('Unable to find ESLint library.', vim.log.levels.WARN)
      return {}
    end,
  },
}
