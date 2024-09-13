return {
  -- No need to copy this inside `setup()`. Will be used automatically.
  {
    "echasnovski/mini.surround",
    -- Options which control module behavior
    opts = {
      options = {
        -- Function to compute custom 'commentstring' (optional)
        -- custom_commentstring = nil,
        custom_commentstring = function()
          require("ts_context_commentstring").setup({
            enable_autocmd = false,
          })

          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,

        -- Whether to ignore blank lines when commenting
        ignore_blank_line = false,

        -- Whether to recognize as comment only lines without indent
        start_of_line = false,

        -- Whether to force single space inner padding for comment parts
        pad_comment_parts = true,
      },

      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        -- Toggle comment (like `gcip` - comment inner paragraph) for both
        -- Normal and Visual modes
        comment = "gc",

        -- Toggle comment on current line
        comment_line = "gcc",

        -- Toggle comment on visual selection
        comment_visual = "gc",

        -- Define 'comment' textobject (like `dgc` - delete whole comment block)
        -- Works also in Visual mode if mapping differs from `comment_visual`
        textobject = "gc",
      },

      -- Hook functions to be executed at certain stage of commenting
      hooks = {
        -- Before successful commenting. Does nothing by default.
        pre = function() end,
        -- After successful commenting. Does nothing by default.
        post = function() end,
      },
    },
  },
}
