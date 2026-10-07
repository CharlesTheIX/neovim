-- Telescope provides fuzzy pickers for files, project text, buffers, help,
-- mappings, LSP results, and diagnostics. Plenary supplies its required Lua
-- utilities. The :Telescope command and mappings in CharlesTheIX.key_bindings
-- load it on demand; live grep additionally requires ripgrep on PATH.

return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = "Telescope",
  },
}
