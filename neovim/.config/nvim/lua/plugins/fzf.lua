return {
  'ibhagwan/fzf-lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    require('fzf-lua').setup({
      'telescope',
      fzf_opts = { ["--layout"] = "reverse" },
      grep = {
        rg_opts = "--sort-files --hidden --column --line-number --no-heading " ..
        "--color=always --smart-case -g '!{.git,node_modules}/*'",
      }
    })
  end,
  keys = {
    { '<leader>e', "<cmd>lua require('fzf-lua').files()<CR>", desc = 'find file' },
    { '<leader>ff', "<cmd>lua require('fzf-lua').grep()<CR>", desc = 'grep' },
    { '<leader>fa', "<cmd>lua require('fzf-lua').grep_cword()<CR>", desc = 'grep current word' },
  },
}
