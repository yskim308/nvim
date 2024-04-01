return {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    -- Lua
    config = function()
        --require('').setup({
            --   style = 'warmer'
            --})
        require('nightfox').load()
        vim.cmd("colorscheme nordfox")
    end
}
