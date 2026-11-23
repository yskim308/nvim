-- Single source of truth for LSP servers.
-- Used by both lspconfig.lua (server settings) and mason.lua (ensure_installed).
return {
  html = {
    filetypes = { "html", "typescriptreact", "javascriptreact", "svelte" },
  },
  ts_ls = {},
  cssls = {},
  tailwindcss = {},
  emmet_ls = {
    filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
  },
  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = "workspace",
        },
      },
    },
    on_init = function(client)
      local cwd = vim.fn.getcwd()
      local venv_path = cwd .. "/.venv/bin/python"
      -- If the .venv exists in the root, tell Pyright to use it
      if vim.fn.executable(venv_path) == 1 then
        client.config.settings.python.pythonPath = venv_path
        -- Notify the server of the configuration change
        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
      end
      return true
    end,
  },
  clangd = {
    cmd = { "clangd" },
  },
  lua_ls = {},
  svelte = {},
  marksman = {},
  dockerls = {},
  gopls = {},
  texlab = {},
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        -- avoiding expensive internal directory traversal.
        cargo = {
          loadOutDirsFromCheck = true,
        },
        check = {
          command = "clippy",
          extraArgs = {},
        },
        -- Recommended: Ensures proc macros are resolved correctly.
        procMacro = {
          enable = true,
        },
      },
    },
  },
}
