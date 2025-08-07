return {
  "catppuccin/nvim",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavor = "frappe",
    })
    require("catppuccin").load()
  end,
}
