return {
  'nvim-lualine/lualine.nvim',
  enabled = true,
  config = function ()
    require('lualine').setup({
      options = {
        theme = 'rose-pine',
      }
    })
  end
}
