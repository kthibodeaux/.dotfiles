local options = { noremap = true }
local silent_options = { noremap = true, silent = true }

local function use_qwerty()
  vim.api.nvim_set_keymap('', 'h', 'h', options)
  vim.api.nvim_set_keymap('', 'j', 'j', options)
  vim.api.nvim_set_keymap('', 'k', 'k', options)

  vim.api.nvim_set_keymap('n', '<C-h>', ':TmuxNavigateLeft<CR>', options)
  vim.api.nvim_set_keymap('n', '<C-j>', ':TmuxNavigateDown<CR>', options)
  vim.api.nvim_set_keymap('n', '<C-k>', ':TmuxNavigateUp<CR>', options)
  vim.api.nvim_set_keymap('n', '<C-l>', ':TmuxNavigateRight<CR>', options)

  print "Using Qwerty style navigation"
end

local function use_colemak()
  vim.api.nvim_set_keymap('', 'h', 'k', options)
  vim.api.nvim_set_keymap('', 'j', 'h', options)
  vim.api.nvim_set_keymap('', 'k', 'j', options)

  vim.api.nvim_set_keymap('n', '<C-j>', ':TmuxNavigateLeft<CR>', options)
  vim.api.nvim_set_keymap('n', '<C-k>', ':TmuxNavigateDown<CR>', options)
  vim.api.nvim_set_keymap('n', '<C-h>', ':TmuxNavigateUp<CR>', options)
  vim.api.nvim_set_keymap('n', '<C-l>', ':TmuxNavigateRight<CR>', options)

  print "Using Colemak style navigation"
end

return {
  use_qwerty = use_qwerty,
  use_colemak = use_colemak
}
