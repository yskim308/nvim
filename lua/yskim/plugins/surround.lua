return {
  "nvim-mini/mini.nvim",
  version = false, -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("mini.surround").setup({
      -- Configuration here, or leave empty to use defaults
    })
  end,
}
