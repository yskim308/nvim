return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "saghen/blink.cmp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local keymap = vim.keymap

        local opts = { silent = true }
        local on_attach = function(_, bufnr)
            opts.buffer = bufnr

            opts.desc = "Show buffer diagnostics"
            keymap.set("n", "<leader>D", function()
                require("snacks").picker.diagnostics_buffer()
            end, opts)

            opts.desc = "Show line diagnostics"
            keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

            opts.desc = "Code actions"
            keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, opts)

            opts.desc = "Show documentation for what is under cursor"
            keymap.set("n", "K", vim.lsp.buf.hover, opts)

            opts.desc = "Restart LSP"
            keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
        end

        local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- Diagnostic symbols in the sign column (gutter)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = signs.Error,
                    [vim.diagnostic.severity.WARN] = signs.Warn,
                    [vim.diagnostic.severity.HINT] = signs.Hint,
                    [vim.diagnostic.severity.INFO] = signs.Info,
                },
            },
        })

        local servers = require("yskim.lsp.servers")

        -- Shared settings for every server
        vim.lsp.config("*", {
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- Configure LSP servers using vim.lsp.config
        for server, config in pairs(servers) do
            vim.lsp.config(server, config)
        end

        -- Enable the configured servers
        for server in pairs(servers) do
            vim.lsp.enable(server)
        end
    end,
}
