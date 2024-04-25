return {
  {
    "nvim-treesitter/nvim-treesitter",
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

        "go",
        "gomod",
        "gowork",
        "gosum",
      },
    },
  },
}
