return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "zaldih/themery.nvim" },
  config = function()
    require("lualine").setup({ options = {
      theme = "auto",
    } })
  end,
}
