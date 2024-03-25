return {
    'navarasu/onedark.nvim',
    priority = 1000,
    -- Lua
    config = function()
        require('onedark').setup({
            style = 'warmer'
        })
        require('onedark').load()
    end
}
