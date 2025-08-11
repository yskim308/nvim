return {
  "numToStr/Comment.nvim",
  opts = {},
  keys = {
    {
      "<leader>m",
      function()
        MiniFiles.open()
      end,
      desc = "Open MiniFiles",
    },
  },
  config = function()
    require("Comment").setup()
  end,
}
