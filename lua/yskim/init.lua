vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.g.mapleader = " "
-- Set leader key
vim.g.mapleader = " " -- or any other leader key you prefer
vim.opt.number = true 
vim.opt.relativenumber = true

vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
