local function git_go_back()
  local filename = vim.api.nvim_eval("expand('%')")
  local command = "git log --follow " .. filename

  require'fzf-lua'.fzf_exec(command, {
    actions = {
      default = function(selected, o)
        local sha = vim.gsplit(selected[1], ' ', { plain = true })
        vim.cmd("silent !tmux split-window -h 'git show " .. sha() .. ":" .. filename .. "'")
      end,
    },
    fzf_opts = {
      ['--preview'] = require'fzf-lua'.shell.preview_action_cmd(function(selected)
        local sha = vim.gsplit(selected[1], ' ', { plain = true })
        return "git show " .. sha() .. ":" .. filename
      end),
    },
  })
end

return {
  git_go_back = git_go_back
}
