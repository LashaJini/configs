return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
  },
  {
    "projekt0n/github-nvim-theme",
  },

  -- -- tokyonight
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = function()
  --     vim.o.background = "dark" -- or "light" for light mode
  --     vim.cmd([[colorscheme tokyonight]])
  --   end,
  -- },

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
