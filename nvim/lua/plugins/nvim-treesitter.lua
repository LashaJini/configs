return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- dependencies = {
    --   {
    --     "JoosepAlviste/nvim-ts-context-commentstring",
    --     init = function()
    --       vim.g.skip_ts_context_commentstring_module = true
    --     end,
    --     opts = {
    --       config = {
    --         dart = { __default = "// %s", __multiline = "/* %s */" },
    --       },
    --     },
    --   },
    -- },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "ninja",
        "python",
        "rst",
        "toml",

        "markdown",
        "markdown_inline",

        "ruby",

        "dart",

        "go",
        "gomod",
        "gowork",
        "gosum",

        "ron",
        "rust",
        "toml",
      },
    },
  },
}
