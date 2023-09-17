-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gopls
require("lspconfig").gopls.setup({})

-- require("spectre").setup({
--   ["send_to_qf"] = {
--     map = "<F1>q",
--     cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
--     desc = "send all items to quickfix",
--   },
-- })
