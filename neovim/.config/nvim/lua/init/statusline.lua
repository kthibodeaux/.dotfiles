vim.api.nvim_set_option('statusline', ''
  .. '%t'
  .. ' %m'
  .. ' %{coc#status()}'
  .. '%r'
  .. '%='
  .. ' %y'
  .. ' %{&fileencoding?&fileencoding:&encoding}'
  .. ' %{&fileformat}'
  .. ' %p%%'
  .. ' %l:%c'
)