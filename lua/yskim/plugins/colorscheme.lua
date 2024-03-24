return {
    'navarasu/onedark.nvim',
    priority = 1000,
    -- Lua
    config = function()
      require('onedark').setup({
        style='warmer'
      })
      vim.cmd.colorscheme('onedark')
    end
}
