local hostname = vim.fn.systemlist('hostname')[1]
local is_beast = hostname == "all-mother"
local is_work = hostname == "linux-kthibodeaux"

return {
  {
    "olimorris/codecompanion.nvim",
    enabled = is_beast,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require('codecompanion').setup({
        interactions = {
          chat = { adapter = "ollama", },
          inline = { adapter = "ollama", },
          cmd = { adapter = "ollama", },
          background = { adapter = "ollama", },
        },
        provider = 'ollama',
        ollama = {
          host = 'http://localhost:11434',
          model = 'qwen2.5-coder',
        },
      })
    end,
    keys = {
      { '<leader>ia', "<cmd>CodeCompanionActions<CR>", desc = 'ai actions' },
    },
  },
  {
    'github/copilot.vim',
    config = function()
      vim.keymap.set('i', '<C-L>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false
      })
      vim.g.copilot_no_tab_map = true
    end,
  },
  {
    "folke/sidekick.nvim",
    enabled = is_work,
    config = function(_, opts)
      require("sidekick").setup(opts)

      -- Auto-resize sidekick terminal to 84 chars when focused
      vim.api.nvim_create_autocmd("WinEnter", {
        callback = function()
          local bufname = vim.api.nvim_buf_get_name(0)
          if bufname:match("term://.*sidekick") or bufname:match("term://.*claude") then
            local current_width = vim.api.nvim_win_get_width(0)
            if current_width < 90 then
              vim.api.nvim_win_set_width(0, 90)
            end
          end
        end,
      })

      -- Add keybinding to enter Normal mode in sidekick terminal
      vim.api.nvim_create_autocmd("TermOpen", {
        callback = function()
          local bufname = vim.api.nvim_buf_get_name(0)
          if bufname:match("term://.*sidekick") or bufname:match("term://.*claude") then
            vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n>]], { buffer = true })
          end
        end,
      })
    end,
    opts = {
      nes = { enabled = false },
    },
    keys = {
      {
        "<tab>",
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if not require("sidekick").nes_jump_or_apply() then
            return "<Tab>" -- fallback to normal tab
          end
        end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
      {
        "<leader>it",
        function()
          require("sidekick.cli").toggle("claude")
        end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>ia",
        function()
          require("sidekick.cli").send({ msg = "{this}" })
        end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>ip",
        function()
          require("sidekick.cli").prompt()
        end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
    },
  },
}
