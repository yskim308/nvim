return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main", -- Explicitly target the new branch
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local langs = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "cpp",
      "python",
      "css",
      "javascript",
      "typescript",
      "tsx",
      "html",
      "markdown",
      "go",
      "markdown_inline",
    }

    require("nvim-treesitter").setup()
    require("nvim-treesitter").install(langs)

    local install_group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      group = install_group,
      pattern = langs,
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)

        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
