-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gopls
-- vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
-- vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])
-- vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=None]])
-- vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=None guibg=None]])

local function border(hl_name)
  return {
    { "┌", hl_name },
    { "─", hl_name },
    { "┐", hl_name },
    { "│", hl_name },
    { "┘", hl_name },
    { "─", hl_name },
    { "└", hl_name },
    { "│", hl_name },
  }
end

-- Add the border on hover and on signature help popup window
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border("FloatBorder") }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border("FloatBorder") }),
}

-- Add border to the diagnostic popup window
vim.diagnostic.config({
  virtual_text = {
    prefix = "■ ", -- Could be '●', '▎', 'x', '■', , 
  },
  float = { border = border("FloatBorder") },
})
require("lspconfig").gopls.setup({ handlers = handlers })
require("lspconfig").tsserver.setup({ handlers = handlers })
require("lspconfig").pyright.setup({ handlers = handlers })
require("lspconfig").sqlls.setup({ handlers = handlers })

-- colorscheme
require("gruvbox").setup({
  contrast = "", -- can be "hard", "soft" or empty string
  transparent_mode = true,
  dim_inactive = false,
})
vim.o.background = "dark" -- or "light" for light mode
vim.cmd("colorscheme gruvbox")

-- ufo
require("ufo").setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { "treesitter", "indent" }
  end,
})

-- delve
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#go-using-delve-directly
require("dapui").setup()
local dap = require("dap")
dap.adapters.delve = {
  type = "server",
  port = "${port}",
  executable = {
    command = "dlv",
    args = { "dap", "-l", "127.0.0.1:${port}" },
  },
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "delve",
    name = "Debug (go.mod)",
    request = "launch",
    -- program = "${file}",
    program = "./${relativeFileDirname}",
  },
  {
    type = "delve",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}",
  },
  -- works with go.mod packages and sub packages
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}",
  },
}

-- -- nvim-cmp
-- local cmp = require("cmp")
-- cmp.setup({
--   window = {
--     -- completion = cmp.config.window.bordered(),
--     -- documentation = cmp.config.window.bordered(),
--     completion = {
--       border = border("CmpMenuBorder"),
--       winhighlight = "Normal:CmpMenu,CursorLine:CmpMenuSel,Search:None",
--     },
--     documentation = {
--       border = border("CmpDocBorder"),
--       winhighlight = "Normal:CmpDoc",
--     },
--   },
-- })

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
