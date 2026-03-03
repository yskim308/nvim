return {
  "nvim-mini/mini.nvim",
  version = false,
  event = "VeryLazy",
  config = function()
    require("mini.surround").setup({
      custom_surroundings = {
        g = {
          -- `input` is REQUIRED for the mapping to be accepted.
          -- Bonus: This specific regex pattern means `sdg` (Surround Delete Generic)
          -- will now correctly find and delete things like `Box<` and `>`!
          input = { "[%w:]-<().-()>" },

          output = function()
            -- Prompt the user
            local obj = vim.fn.input("Generic Type: ")

            -- If you press Escape, cancel the surround
            if obj == nil then
              return nil
            end

            -- If you just hit Enter without typing, just wrap in <>
            if obj == "" then
              return { left = "<", right = ">" }
            end

            -- Otherwise, wrap in Type< >
            return { left = obj .. "<", right = ">" }
          end,
        },
      },
    })
  end,
}
