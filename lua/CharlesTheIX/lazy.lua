-- Bootstrap lazy.nvim into Neovim's data directory when it is missing, add it
-- to the runtime path, and import every plugin spec under
-- lua/CharlesTheIX/plugins/. A first run therefore requires Git and network
-- access; later starts use the checked-out plugin manager and lazy-lock.json.
--
-- Plugin behavior belongs in individual spec files. Keeping this module
-- limited to plugin-manager setup makes the active import chain explicit and
-- prevents the historical lua/plugins/ directory from being loaded.

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if vim.fn.isdirectory(lazypath) == 0 then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.mkdir(vim.fn.fnamemodify(lazypath, ":h"), "p")
  local output = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })

  if vim.v.shell_error ~= 0 then
    error("Failed to clone lazy.nvim:\n" .. output)
  end
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  spec = {
    { import = "CharlesTheIX.plugins" },
  },
})
