return {
  "windwp/nvim-ts-autotag",
  config = function()
    require("nvim-ts-autotag").setup({
      opts = {
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs
        enable_close_on_slash = false, -- No auto-close on </
      },
      per_filetype = {
        html = { enable_close = false }, -- override for HTML only
      },
    })
  end,
}
