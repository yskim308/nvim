return {
    'rose-pine/neovim',
    priority = 1000,
    config = function()
        require("rose-pine").setup({
            variant = "moon"
        })
        --vim.o.background = "dark"
        vim.cmd('colorscheme rose-pine')
        --vim.cmd('colorscheme gruvbox')
    end
}
