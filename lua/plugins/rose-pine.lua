return {
  "rose-pine/neovim",
  enabled = true,
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      variant = "auto",
      dark_variant = "main",
      dim_inactive_windows = false,
      extend_background_behind_borders = true,

      enable = {
        terminal = true,
        migrations = true,
        legacy_highlights = true,
      },

      styles = {
        bold = true,
        italic = true,
        transparency = false,
      },

      groups = {
        link = "iris",
        border = "muted",
        panel = "surface",

        hint = "iris",
        info = "foam",
        note = "pine",
        todo = "rose",
        warn = "gold",
        error = "love",

        git_add = "foam",
        git_text = "rose",
        git_dirty = "rose",
        git_merge = "iris",
        git_stage = "iris",
        git_change = "rose",
        git_rename = "pine",
        git_delete = "love",
        git_ignore = "muted",
        git_untracked = "subtle",

        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
      },
    })

    vim.cmd("colorscheme rose-pine")

    vim.cmd([[
      highlight Normal guibg=none
      highlight NormalFloat guibg=none
    ]])
  end
}
