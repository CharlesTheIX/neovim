-- lualine.nvim replaces Neovim's built-in statusline with a single global
-- statusline shared by all splits. It reports editing mode, Git state,
-- diagnostics, the current file, attached language servers, file metadata,
-- progress through the buffer, and the cursor location.
--
-- The Rose Pine theme follows the colorscheme configured in rose-pine.lua.
-- nvim-web-devicons supplies filetype icons because this configuration declares
-- a Nerd Font in CharlesTheIX.init. lualine loads after startup so the
-- colorscheme and editor-wide options are already in place.

return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        theme = "rose-pine",
        globalstatus = true,
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
          {
            "filename",
            path = 1,
            symbols = {
              modified = " ●",
              readonly = " 󰌾",
              unnamed = "[No Name]",
              newfile = "[New]",
            },
          },
        },
        lualine_x = {
          "lsp_status",
          "encoding",
          "fileformat",
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },
}
