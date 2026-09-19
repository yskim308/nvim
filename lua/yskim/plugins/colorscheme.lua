return {
    "zaldih/themery.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-telescope/telescope.nvim",
        "rebelot/kanagawa.nvim",
        "catppuccin/nvim",
        "ellisonleao/gruvbox.nvim",
        "tanvirtin/monokai.nvim",
        "rose-pine/neovim",
        "loctvl842/monokai-pro.nvim",
        -- Add your themes here
    },
    config = function()
        -- Transparency is handled by each theme's own option, so it survives
        -- themery switching between them.
        require("kanagawa").setup({ transparent = true })
        require("catppuccin").setup({
            transparent_background = true,
            float = { transparent = true },
        })
        require("gruvbox").setup({ transparent_mode = true })
        require("rose-pine").setup({ styles = { transparency = true } })
        require("monokai-pro").setup({ transparent_background = true })

        require("themery").setup({
            themes = { "kanagawa", "kanagawa-lotus", "catppuccin", "gruvbox", "monokai", "rose-pine", "monokai-pro" },
            livePreview = true,
        })
    end,
}
