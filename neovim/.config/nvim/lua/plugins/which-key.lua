return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup({
      plugins = { spelling = true },
      replace = { ["<leader>"] = "SPC" },
    })
    wk.add({
      -- custom names for keys
      { "<leader>f",  name = "+file" },
      { "<leader>g",  name = "+git" },
      { "<leader>r",  name = "+specs" },
      { "<leader>l",  name = "+lsp" },
    })
  end,
}
