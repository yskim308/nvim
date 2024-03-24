return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function ()
        local nvimtree = require("nvim-tree")
        local api = require "nvim-tree.api"
        -- disable netrw at the very start of your init.lua
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- optionally enable 24-bit colour
        vim.opt.termguicolors = true

        -- empty setup using defaults
        require("nvim-tree").setup()
        vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>")
        vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeFocus<CR>") 
    end
}
