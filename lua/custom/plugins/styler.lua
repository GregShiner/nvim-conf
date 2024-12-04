return {
  'folke/styler.nvim',
  enabled = false,
  config = function()
    require('styler').setup {
      themes = {
        terminal = { colorscheme = 'default' },
      },
    }
  end,
}
