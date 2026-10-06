-- Telescope provides fuzzy pickers for files, text, buffers, help, and more.
-- Use <leader>sf/sg/sw/sb/sh/sk/s. for common pickers; mappings are
-- centralized in CharlesTheIX.key_bindings.

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
