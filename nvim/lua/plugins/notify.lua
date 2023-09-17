return {
  {
    "rcarriga/nvim-notify",
    opts = {
      render = "compact",
      max_height = function()
        return math.floor(vim.o.lines * 0.65)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.65)
      end,
    },
  },
}
