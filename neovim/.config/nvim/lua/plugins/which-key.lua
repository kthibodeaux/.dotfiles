return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup({
      plugins = { spelling = true },
      key_labels = { ["<leader>"] = "SPC" },
    })
    wk.register({
      mode = { "n", "v" },
      -- custom names for keys
      ["<leader>f"] = { name = "+file" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>r"] = { name = "+specs" },
      ["<leader>l"] = { name = "+lsp" },
    })
  end,
}
