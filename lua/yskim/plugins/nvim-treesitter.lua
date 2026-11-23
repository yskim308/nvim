return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main", -- Explicitly target the new branch
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local parsers = {
      "bash",
      "bibtex",
      "c",
      "cpp",
      "css",
      "dockerfile",
      "go",
      "html",
      "javascript",
      "json",
      "latex",
      "lua",
      "markdown",
      "markdown_inline",
      "prisma",
      "python",
      "rust",
      "svelte",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    }

    -- Map filetypes whose parser name differs (or isn't auto-detected).
    vim.treesitter.language.register("bash", "sh")
    vim.treesitter.language.register("bibtex", "bib")
    vim.treesitter.language.register("javascript", "javascriptreact")
    vim.treesitter.language.register("latex", "plaintex")
    vim.treesitter.language.register("latex", "tex")
    vim.treesitter.language.register("tsx", "typescriptreact")

    require("nvim-treesitter").setup()
    require("nvim-treesitter").install(parsers)

    local install_group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      group = install_group,
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if not lang or not vim.tbl_contains(parsers, lang) then
          return
        end

        local ok, parser = pcall(vim.treesitter.get_parser, args.buf, lang)
        if not ok or not parser then
          return
        end

        vim.treesitter.start(args.buf, lang)
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
