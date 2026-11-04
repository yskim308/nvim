return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = false,
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = "vault",
        path = "~/Documents/Obsidian Vault",
      },
    },
    picker = { name = "snacks.picker" },
    callbacks = {
      enter_note = function()
        vim.keymap.set("n", "<leader>ob", function()
          require("snacks").picker.lsp_references()
        end, { buffer = true, desc = "Backlinks" })
      end,
    },
  },
}
