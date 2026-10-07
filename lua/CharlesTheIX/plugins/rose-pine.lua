-- Rose Pine is the active colorscheme and loads before other visual plugins so
-- they can inherit its highlights. The dark "main" palette is selected unless
-- Neovim's background requests the light variant, and transparent backgrounds
-- let the terminal supply the final backdrop. Change palettes at runtime with
-- :colorscheme rose-pine-main, rose-pine-moon, or rose-pine-dawn.

return {
  {
    "rose-pine/neovim",
    name = "rose-pine", -- Use the Rose Pine colorscheme name for the plugin.
    priority = 1000, -- Load the colorscheme before other plugins.
    config = function()
      require("rose-pine").setup({
        variant = "auto", -- Choose the light or dark palette from 'background'.
        dark_variant = "main", -- Use the main palette when the background is dark.
        styles = {
          transparency = true, -- Leave backgrounds unset so the terminal background shows through.
        },
      })

      vim.cmd.colorscheme("rose-pine")
    end,
  },
}
