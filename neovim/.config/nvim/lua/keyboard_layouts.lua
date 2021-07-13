local options = { noremap = true }
local silent_options = { noremap = true, silent = true }

local function use_qwerty()
  vim.api.nvim_set_keymap('n', 'h', 'h', options)
  vim.api.nvim_set_keymap('n', 'j', 'j', options)
  vim.api.nvim_set_keymap('n', 'k', 'k', options)

  vim.api.nvim_set_keymap('n', '<c-h>', ':TmuxNavigateLeft<CR>', silent_options)
  vim.api.nvim_set_keymap('n', '<c-j>', ':TmuxNavigateDown<CR>', silent_options)
  vim.api.nvim_set_keymap('n', '<c-k>', ':TmuxNavigateUp<CR>', silent_options)
  vim.api.nvim_set_keymap('n', '<c-l>', ':TmuxNavigateRight<CR>', silent_options)

  print "Using Qwerty style navigation"
end

local function use_colemak()
  vim.api.nvim_set_keymap('n', 'h', 'k', options)
  vim.api.nvim_set_keymap('n', 'j', 'h', options)
  vim.api.nvim_set_keymap('n', 'k', 'j', options)

  vim.api.nvim_set_keymap('n', '<c-j>', ':TmuxNavigateLeft<CR>', silent_options)
  vim.api.nvim_set_keymap('n', '<c-k>', ':TmuxNavigateDown<CR>', silent_options)
  vim.api.nvim_set_keymap('n', '<c-h>', ':TmuxNavigateUp<CR>', silent_options)
  vim.api.nvim_set_keymap('n', '<c-l>', ':TmuxNavigateRight<CR>', silent_options)

  print "Using Colemak style navigation"
end

return {
  use_qwerty = use_qwerty,
  use_colemak = use_colemak
}
