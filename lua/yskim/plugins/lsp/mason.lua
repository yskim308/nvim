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
        "basedpyright",
        "clangd",
        "prismals",
        "marksman",
      },
      automatic_setup = false,
    })
  end,
}
