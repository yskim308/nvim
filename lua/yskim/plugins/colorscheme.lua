return {
  "flashcodes-themayankjha/fkthemes.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim",
    "rebelot/kanagawa.nvim",
    "catppuccin/nvim",
    "ellisonleao/gruvbox.nvim",
    "tanvirtin/monokai.nvim",
    -- Add your themes here
  },
  config = function()
    require("fkthemes").setup({
      themes = { "kanagawa", "catppuccin", "gruvbox", "monokai" },
      default_theme = "kanagawa",
      transparent_background = true,
    })
  end,
}
