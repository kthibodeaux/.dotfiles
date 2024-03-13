return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local current_signature = function()
      local sig = require("lsp_signature").status_line(80)

      if sig.label == "" and sig.hint == "" then
        return ""
      end

      return sig.label .. " ➿" .. sig.hint
    end

    require('lualine').setup({
      options = {
        theme = 'auto',
        icons_enabled = false,
        section_separators = '',
        component_separators = ''
      },
      sections = {
        lualine_a = {'filename'},
        lualine_b = {},
        lualine_c = {current_signature},
        lualine_x = {'filetype'},
        lualine_y = {},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {'filename'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {'filetype'},
        lualine_y = {},
        lualine_z = {'location'}
      },
      tabline = {},
    })
  end,
}
