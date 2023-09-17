vim.filetype.add({
  extension = { snippets = "snippets" },
})

local function silent_map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { silent = true })
end

silent_map({ "i", "v" }, "<A-l>", function()
  require("luasnip").jump(1)
end)

silent_map({ "i", "v" }, "<A-h>", function()
  require("luasnip").jump(-1)
end)

return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    -- follow latest release.
    version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    opts = function()
      require("luasnip.loaders.from_snipmate").load()
    end,
  },
}
