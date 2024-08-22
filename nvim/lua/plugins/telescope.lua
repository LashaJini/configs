return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        event = "VeryLazy",
        config = function(_, _)
          require("lazyvim.util").on_load("telescope.nvim", function()
            require("telescope").load_extension("live_grep_args")
          end)
        end,
        keys = {
          { "<leader>/", ":Telescope live_grep_args<CR>", desc = "Live Grep" },
        },
      },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-n>"] = false,
            ["<C-p>"] = false,
            ["<C-s>"] = "select_horizontal",
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    },
  },
}
