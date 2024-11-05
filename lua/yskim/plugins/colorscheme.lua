return {
    'rose-pine/neovim',
    --'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
        require("rose-pine").setup({
            variant = "moon",
        })
        --require("gruvbox").setup()
        --vim.o.background = "dark"
        vim.cmd('colorscheme rose-pine')
        --vim.cmd('colorscheme gruvbox')
    end
}
