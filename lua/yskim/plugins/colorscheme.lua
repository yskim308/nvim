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
    require("themery").setup({
      themes = { "kanagawa", "kanagawa-lotus", "catppuccin", "gruvbox", "monokai", "rose-pine", "monokai-pro" },
      livePreview = true,
    })
  end,
}
