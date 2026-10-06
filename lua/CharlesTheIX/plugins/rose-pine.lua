-- Rose Pine is the active color scheme. This spec selects it during startup;
-- change palettes with :colorscheme rose-pine-main, rose-pine-moon, or
-- rose-pine-dawn.

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
