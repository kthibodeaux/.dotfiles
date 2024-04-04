return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },
          ["core.concealer"] = {
            config = {
              icon_preset = "diamond",
            },
          },
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/notes",
                yonder = "~/tabletop_rpg/Dungeons and Dragons 5e/My Campaigns/Yonder/neorg",
              },
            },
          },
        },
      }
    end,
  }
}
