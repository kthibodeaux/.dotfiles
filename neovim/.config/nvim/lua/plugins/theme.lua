return {
  'EdenEast/nightfox.nvim',
  config = function()
    require('nightfox').setup({
      options = {
        transparent = true,
        styles = {
          comments = 'italic',
          keywords = 'bold',
          types = 'bold',
        }
      }
    })

    vim.cmd('colorscheme duskfox')
  end,
}
