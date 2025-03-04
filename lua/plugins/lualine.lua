return {
  'nvim-lualine/lualine.nvim',
  enabled = ftrue,
  config = function ()
    require('lualine').setup({
      options = {
        theme = 'rose-pine',
      }
    })
  end
}
