return {
    'shaunsingh/nord.nvim',
    --'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
        --require("nord").setup()
        --require("gruvbox").setup()
        --vim.o.background = "dark"
        vim.cmd('colorscheme nord')
        --vim.cmd('colorscheme gruvbox')
    end
}
