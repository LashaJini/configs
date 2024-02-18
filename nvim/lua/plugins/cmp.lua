return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "Saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        config = true,
      },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "cody" },
        { name = "crates" },
      }))

      opts.snippet = {
        expand = function(args)
          vim.fn["luasnip"].lsp_expand(args.body)
        end,
      }

      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "red" })

      opts.window = {
        completion = cmp.config.window.bordered({
          winhighlight = "Normal:Normal,NormalFloat:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
          -- winhighlight = "Normal:CmpMenu,CursorLine:CmpMenuSel,Search:None",
        }),
        documentation = cmp.config.window.bordered({
          winhighlight = "Normal:Normal,NormalFloat:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
          -- winhighlight = "Normal:CmpDoc",
        }),
      }
    end,
  },
}
