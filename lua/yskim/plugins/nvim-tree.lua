return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function ()
        local nvimtree = require("nvim-tree")
        -- disable netrw at the very start of your init.lua
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- optionally enable 24-bit colour
        vim.opt.termguicolors = true

        --line numbers
        -- empty setup using defaults
        require("nvim-tree").setup({
            view = {
                relativenumber = true,
                width = 30,
                side = 'right'
            },     
        })

        vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>")
        vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>") 

    end
}
