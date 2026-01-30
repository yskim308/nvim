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
    -- Add your themes here
  },
  config = function()
    require("themery").setup({
      themes = { "kanagawa", "catppuccin", "gruvbox", "monokai", "rose-pine" },
      livePreview = true,
    })
  end,
}
