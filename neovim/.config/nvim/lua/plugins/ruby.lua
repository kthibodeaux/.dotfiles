return {
  {
    'thoughtbot/vim-rspec',
    config = function()
      vim.g.rspec_command = 'call VimuxRunCommand("bes {spec}\n")'
    end,
  },
  {
    'tpope/vim-rails'
  },
  {
    'rhysd/vim-textobj-ruby',
    dependencies = {
      'kana/vim-textobj-user'
    },
  },
}
