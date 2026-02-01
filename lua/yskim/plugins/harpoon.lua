-- lua/plugins/harpoon.lua
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
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
    map("n", "<leader>s", function()
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

    -- Telescope integration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        })
        :find()
    end

    map("n", "<leader>fh", function()
      toggle_telescope(harpoon:list())
    end, opts)
  end,
}
