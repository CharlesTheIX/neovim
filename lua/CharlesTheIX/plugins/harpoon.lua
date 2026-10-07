-- Harpoon 2 keeps persistent lists of frequently used files, scoped to
-- Neovim's current working directory. Plenary is its required Lua utility
-- dependency. Lists are saved whenever the menu closes; use <leader>ha to add
-- a file, <leader>hf to open the menu, and <leader>h1 through <leader>h9 to
-- jump to entries. All mappings live in CharlesTheIX.key_bindings.

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
