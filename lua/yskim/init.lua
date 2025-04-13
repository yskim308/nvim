vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.g.mapleader = " "
-- Set leader key
vim.opt.number = true 
vim.opt.relativenumber = true

vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = true

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.wo.signcolumn = "number"

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
        "javascript", 
        "typescript", 
        "typescriptreact",
        "javascriptreact",
        "html",
        "css",
        "json",
  },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})
