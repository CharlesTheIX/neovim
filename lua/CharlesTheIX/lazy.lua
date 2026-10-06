-- Bootstrap lazy.nvim if needed, add it to runtimepath, and load plugin specs
-- from CharlesTheIX.plugins.

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
