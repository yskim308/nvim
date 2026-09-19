return {
    "saghen/blink.cmp",
    -- Only load the completion engine when it is actually needed
    event = { "InsertEnter", "CmdlineEnter" },
    -- Use a release tag so the prebuilt fuzzy matcher binary can be downloaded
    version = "1.*",
    dependencies = {
        -- Keep LuaSnip so the existing snippet collection keeps working
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- Use LuaSnip to expand and jump through snippets
        snippets = { preset = "luasnip" },

        keymap = {
            -- Tab accepts the selected item and jumps through snippet placeholders
            preset = "super-tab",
            ["<C-e>"] = { "cancel", "fallback" },
            ["<CR>"] = { "accept", "fallback" },
        },

        completion = {
            -- Show documentation for the selected item, like before
            documentation = { auto_show = true, auto_show_delay_ms = 500 },
            -- Don't open the menu while jumping through snippet placeholders
            trigger = { show_in_snippet = false },
        },

        sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    -- Keep lazydev completions at the top of the list
                    score_offset = 100,
                },
            },
        },

        cmdline = {
            keymap = { preset = "cmdline" },
            completion = { menu = { auto_show = true } },
        },
    },
    opts_extend = { "sources.default" },
    config = function(_, opts)
        -- Load friendly-snippets (and any other vscode-style snippets) into LuaSnip
        require("luasnip.loaders.from_vscode").lazy_load()
        require("blink.cmp").setup(opts)
    end,
}
