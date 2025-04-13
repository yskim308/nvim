return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                javascript = { "prettier_d", "prettier", stop_after_first = true },
                javascriptreact = { "prettier_d", "prettier", stop_after_first = true },
                typescript = { "prettier_d", "prettier", stop_after_first = true },
                typescriptreact = { "prettier_d", "prettier", stop_after_first = true },
                svelte = { "prettier_d", "prettier", stop_after_first = true },
                css = { "prettier_d", "prettier", stop_after_first = true },
                html = { "prettier_d", "prettier", stop_after_first = true },
                json = { "prettier_d", "prettier", stop_after_first = true },
                markdown = { "prettier_d", "prettier", stop_after_first = true },
                lua = { "stylelua" },
                python = { "isort", "black" }
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 500
            }
        })
        vim.keymap.set({ "n", "v" }, "<leader>mp", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500
            })
        end, { desc = "format file or range in visual mode" })
    end
}
