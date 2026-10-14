-- Tracks in-flight LSP work-done progress (indexing, loading, ...) for the statusline.
local M = {}

local active = {} -- ["<client_id>:<token>"] = { client_id, title, message, percentage }

function M.setup()
  vim.api.nvim_create_autocmd('LspProgress', {
    callback = function(ev)
      local client_id = ev.data.client_id
      local params = ev.data.params
      local value = params.value
      local key = client_id .. ':' .. tostring(params.token)

      if value.kind == 'end' then
        active[key] = nil
      else
        local prev = active[key] or {}
        active[key] = {
          client_id = client_id,
          title = value.title or prev.title,
          message = value.message or prev.message,
          percentage = value.percentage or prev.percentage,
        }
      end

      vim.schedule(function()
        require('lualine').refresh()
      end)
    end,
  })
end

function M.status()
  local parts = {}
  for key, item in pairs(active) do
    local client = vim.lsp.get_client_by_id(item.client_id)
    if client then
      local text = client.name .. ': ' .. (item.title or '')
      if item.message then
        text = text .. ' ' .. item.message
      end
      if item.percentage then
        text = text .. ' ' .. item.percentage .. '%'
      end
      parts[#parts + 1] = text
    else
      active[key] = nil
    end
  end
  table.sort(parts)
  -- the result is embedded in 'statusline', where % is a format character
  return (table.concat(parts, ' | '):gsub('%%', '%%%%'))
end

return M
