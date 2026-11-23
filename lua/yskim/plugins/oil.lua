return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  config = function()
    require("oil").setup({
      win_options = {
        signcolumn = "yes:2",
      },
    })
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
  lazy = false,
}
