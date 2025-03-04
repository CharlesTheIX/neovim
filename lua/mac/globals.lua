vim.g.mapleader = " " -- Sets the leader character for custom maps and motions
vim.g.maplocalleader = " " -- Sets the local leader character for custom maps and motions
vim.g.have_nerd_font = true -- Enable the Nerd font to be used
vim.cmd("let g:netrw_liststyle = 3")
vim.opt.spell = true
vim.opt.spelllang = "en_gb"

-- Remaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = 'Return to [p]roject [v]iew from buffer' })
vim.keymap.set("n", "-", vim.cmd.Oil, { desc = "Return to root directory of project (like <leader>pv)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Scroll down half a page' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Scroll up half a page' })
vim.keymap.set("n", "J", "mzJ`z", { desc = 'Join the current line with the next line' })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move the selected lines down' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move the selected lines up' })
vim.keymap.set("n", "<leader>yf", "gg0vG$y", { desc = 'Yank the entire file' })
vim.keymap.set("n", "<leader>af", "gg0vG$", { desc = 'Select the entire file' })
vim.keymap.set("n", "<leader>=", "gg0vG$=", { desc = 'Format the entire file' })
vim.keymap.set("n", "n", "nzzzv", { desc = 'Center the screen after jumping to the next match' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'Center the screen after jumping to the previous match' })
vim.keymap.set("n", "<leader>w", "<C-w>", { desc = 'Enter window mode' })
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = 'Paste while keeping the pasted item in register' })

vim.api.nvim_set_keymap("i", "<A-Esc>", "<Esc>", { noremap = true, silent = true, desc = 'Escape with Alt' })
