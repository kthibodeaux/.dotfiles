return {
  'ibhagwan/fzf-lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    require('fzf-lua').setup({
      'default',
      winopts    = {
        width   = 1,
        height  = 1,
        preview = {
          hidden       = "nohidden",
          vertical     = "down:70%",
          horizontal   = "down:70%",
        },
      },
      grep = {
        rg_opts = "--sort-files --hidden --column --line-number --no-heading " ..
        "--color=always --smart-case -g '!{.git,node_modules}/*'",
      },
      keymap = {
        builtin = {
          ['<c-d>'] = 'preview-page-down',
          ['<c-u>'] = 'preview-page-up',
        },
        fzf = {
          ['ctrl-a'] = 'select-all+accept',
        },
      },
    })
  end,
  keys = {
    { '<leader>e', "<cmd>lua require('fzf-lua').files()<CR>", desc = 'find file' },
    { '<leader>n', "<cmd>lua require('fzf-lua').buffers()<CR>", desc = 'find buffer' },
    { '<leader>fg', "<cmd>lua require('fzf-lua').git_status()<CR>", desc = 'changed files' },
    { '<leader>ff', "<cmd>lua require('fzf-lua').grep({ no_esc=true })<CR>", desc = 'grep' },
    { '<leader>fl', "<cmd>lua require('fzf-lua').live_grep({ no_esc=true })<CR>", desc = 'live grep' },
    { '<leader>fa', "<cmd>lua require('fzf-lua').grep_visual()<CR>", mode = 'v', desc = 'grep visual selection' },
    { '<leader>fa', "<cmd>lua require('fzf-lua').grep_cword()<CR>", desc = 'grep current word' },
  },
}
