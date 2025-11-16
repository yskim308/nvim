return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "lua_ls",
        "tailwindcss",
        "svelte",
        "emmet_ls",
        "pyright",
        "clangd",
        "prismals",
        "marksman",
        "dockerls",
        "gopls",
        "rust_analyzer",
      },
      automatic_setup = false,
    })
  end,
}
