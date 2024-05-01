return {
  "mistricky/codesnap.nvim",
  build = "make build_generator",
  keys = {
    { "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
    { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures/snaps" },
  },
  opts = {
    save_path = "~/Pictures/snaps",
    has_breadcrumbs = true,
    has_line_number = true,
    watermark = "",
    bg_theme = "bamboo",
  },
}
