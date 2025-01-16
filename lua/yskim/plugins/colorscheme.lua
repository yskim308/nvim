return {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
        require("gruvbox").setup()
        --vim.o.background = "dark"
        --vim.cmd('colorscheme rose-pine')
        vim.cmd('colorscheme gruvbox')
    end
}
