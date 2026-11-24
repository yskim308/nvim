return {
  "saghen/blink.cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  version = "1.*",
  dependencies = { "rafamadriz/friendly-snippets" },
  opts = {
    keymap = {
      -- Tab accepts the selected item (like VSCode)
      preset = "super-tab",
      ["<CR>"] = { "accept", "fallback" },
    },
    completion = {
      trigger = { show_in_snippet = false },
    },
    sources = {
      -- Only auto-show for normal typing after 2 characters. Manual triggers
      -- and LSP trigger characters still work immediately.
      min_keyword_length = function(ctx)
        if ctx.trigger.initial_kind == "manual" or ctx.trigger.initial_kind == "trigger_character" then
          return 0
        end
        return 2
      end,
      providers = {
        -- No regular buffer-word completions; LSP/path/snippets only.
        buffer = { enabled = false },
      },
    },
  },
}
