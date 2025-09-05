return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag", -- auto-close & rename HTML/JSX tags
  },
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "cpp",
        "python",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "markdown",
        "markdown_inline",
      },
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      modules = {},

      highlight = { enable = true }, -- syntax highlighting
      indent = { enable = true }, -- smart indentation
      incremental_selection = { -- expand/shrink selections
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          scope_incremental = "<S-CR>",
          node_decremental = "<BS>",
        },
      },
    })
  end,
}
