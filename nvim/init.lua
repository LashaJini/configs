-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gopls
require("lspconfig").gopls.setup({})
require("lspconfig").tsserver.setup({})
require("lspconfig").pyright.setup({})

-- ufo
require("ufo").setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { "treesitter", "indent" }
  end,
})
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.foldingRange = {
--   dynamicRegistration = false,
--   lineFoldingOnly = true,
-- }
-- local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
-- for _, ls in ipairs(language_servers) do
--   require("lspconfig")[ls].setup({
--     capabilities = capabilities,
--     -- you can add other fields for setting up lsp server in this table
--   })
-- end
-- require("ufo").setup()

-- require("spectre").setup({
--   ["send_to_qf"] = {
--     map = "<F1>q",
--     cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
--     desc = "send all items to quickfix",
--   },
-- })
