return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-ts-autotag")
    configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "cpp", "python", "css", "javascript", "html" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
    })
  end,
}
