return {
  cmd = { 'golangci-lint-langserver' },
  filetypes = { 'go', 'gomod' },
  init_options = {
    command = { "golangci-lint", "run", "--out-format", "json" }
  },
  root_markers = { '.golangci.yml', '.golangci.yaml', '.golangci.toml', '.golangci.json', 'go.work', 'go.mod', '.git' },
}
