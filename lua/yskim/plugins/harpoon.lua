-- lua/plugins/harpoon.lua
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local harpoon = require("harpoon")
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Required Harpoon setup
    harpoon:setup()

    -- Add current file to Harpoon
    map("n", "<leader>a", function()
      harpoon:list():add()
    end, opts)

    -- Toggle quick menu
    map("n", "<leader>h", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, opts)

    -- Jump to file slots dynamically (1–9)
    for i = 1, 9 do
      map("n", string.format("<leader>%d", i), function()
        harpoon:list():select(i)
      end, opts)
    end

    -- Cycle through files
    map("n", "<C-S-P>", function()
      harpoon:list():prev()
      -- Cycle through files
      map("n", "<C-S-P>", function()
        harpoon:list():prev()
      end, opts)
      map("n", "<C-S-N>", function()
        harpoon:list():next()
      end, opts)
    end, opts)
    map("n", "<C-S-N>", function()
      harpoon:list():next()
    end, opts)
  end,
}
