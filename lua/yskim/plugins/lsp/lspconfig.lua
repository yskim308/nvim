return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr
      --
      -- -- set keybinds
      -- opts.desc = "Show LSP references"
      -- keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
      --
      -- opts.desc = "Go to declaration"
      -- keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      --
      -- opts.desc = "Show LSP definitions"
      -- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
      --
      -- opts.desc = "Show LSP implementations"
      -- keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
      --
      -- opts.desc = "Show LSP type definitions"
      -- keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

      -- opts.desc = "See available code actions"
      -- keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts)

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Configure LSP servers using vim.lsp.config
    local servers = {
      html = {
        filetypes = { "html", "typescriptreact", "javascriptreact", "svelte" },
      },
      ts_ls = {},
      cssls = {},
      tailwindcss = {},
      prismals = {},
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
        cmd = { "clangd", "--compile-commands-dir=build" },
      },
      lua_ls = {},
      marksman = {},
      dockerls = {},
      gopls = {},
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

    for server, config in pairs(servers) do
      vim.lsp.config(
        server,
        vim.tbl_deep_extend("force", {
          capabilities = capabilities,
          on_attach = on_attach,
        }, config)
      )
    end

    -- Enable the configured servers
    for server, _ in pairs(servers) do
      vim.lsp.enable(server)
    end
  end,
}
