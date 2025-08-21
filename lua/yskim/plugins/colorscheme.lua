return {
  "catppuccin/nvim",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
    })
    require("catppuccin").load()
  end,
}
