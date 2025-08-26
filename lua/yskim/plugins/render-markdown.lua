return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter",
    "echasnovski/mini.nvim",
    "echasnovski/mini.icons", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
  config = function()
    require("render-markdown").setup({})
  end,
}
