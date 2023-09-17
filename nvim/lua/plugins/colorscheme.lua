return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    opts = function()
      vim.o.background = "dark" -- or "light" for light mode
      vim.cmd([[colorscheme gruvbox]])
    end,
  },

  -- -- kanagawa
  -- {
  --   "rebelot/kanagawa.nvim",
  --   opts = function()
  --     vim.o.background = "dark" -- or "light" for light mode
  --   end,
  -- },

  -- -- monokai
  -- {
  --   "tanvirtin/monokai.nvim",
  --   opts = function()
  --     vim.o.background = "dark" -- or "light" for light mode
  --   end,
  -- },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
  },
}
