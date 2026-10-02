print("Hello from CharlesTheIX!")

-- General Neovim settings for CharlesTheIX configuration
vim.g.mapleader = " " -- Sets the leader character for custom maps and motions
vim.g.maplocalleader = " " -- Sets the local leader character for custom maps and motions
vim.g.have_nerd_font = true -- Enable the Nerd font to be used

require('CharlesTheIX.key_bindings')