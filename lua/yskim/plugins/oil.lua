return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  config = function()
    require("oil").setup({
      win_options = {
        signcolumn = "yes:2",
      },
    })
  end,
  lazy = false,
}
