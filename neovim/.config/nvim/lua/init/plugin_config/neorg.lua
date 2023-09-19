require('neorg').setup {
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.concealer"] = {
      config = {
        icon_preset = "diamond",
      },
    }, -- Adds pretty icons to your documents
    ["core.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          yonder = "~/tabletop_rpg/Dungeons and Dragons 5e/My Campaigns/Yonder/neorg",
        },
      },
    },
  },
}
