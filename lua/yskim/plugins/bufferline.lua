return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function ()
        vim.opt.termguicolors = true
        require('bufferline').setup({})
        local map = vim.keymap.set
        map('n', '<Tab>', ":bnext<CR>")
        map('n', "<S-Tab>", ":bprevious<CR>")
        map("n", "<leader>x", ":bdelete<CR>")
    end
}

