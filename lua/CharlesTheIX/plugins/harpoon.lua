-- Harpoon 2 keeps project-local lists of frequently used files. Use
-- <leader>ha to mark the current file, <leader>hf to open the list, and
-- <leader>h1 through <leader>h9 to jump to marks; all mappings are in
-- CharlesTheIX.key_bindings.

return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      settings = {
        save_on_toggle = true,
      },
    },
  },
}
