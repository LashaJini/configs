-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
---- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<leader>bg", ':exec &bg=="light"? "set bg=dark" : "set bg=light"<CR>', { noremap = true, silent = true })
map("n", "s", "xi", { desc = "x + i", remap = true })

map("n", "<leader>q", ":bd<cr>", { desc = "Close", remap = true })
map("n", "<leader>aq", ":qa<cr>", { desc = "Close all", remap = true })
map("n", "<leader>w", ":w<cr>", { desc = "Save", remap = true })
map("n", "<leader>aw", ":wa<cr>", { desc = "Save all", remap = true })

-- windows
map("n", "<leader>pw", "<C-W>p", { desc = "Previous window", remap = true })
-- map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>\\", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "<leader>h", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("n", "<leader>j", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("n", "<leader>k", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("n", "<leader>l", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
map("n", "<leader>=", "<C-W>=", { desc = "Resize windows" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-k>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-l>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-h>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map({ "n", "i" }, "<A-1>", "<Esc>1gt", { desc = "First Tab" })
map({ "n", "i" }, "<A-2>", "<Esc>2gt", { desc = "Second Tab" })
map({ "n", "i" }, "<A-3>", "<Esc>3gt", { desc = "3rd Tab" })
map({ "n", "i" }, "<A-4>", "<Esc>4gt", { desc = "4th Tab" })
map({ "n", "i" }, "<A-5>", "<Esc>5gt", { desc = "5th Tab" })
map({ "n", "i" }, "<A-6>", "<Esc>6gt", { desc = "6th Tab" })
map({ "n", "i" }, "<A-7>", "<Esc>7gt", { desc = "7th Tab" })
map({ "n", "i" }, "<A-8>", "<Esc>8gt", { desc = "8th Tab" })
map({ "n", "i" }, "<A-9>", "<Esc>9gt", { desc = "9th Tab" })

-- buffers
if Util.has("bufferline.nvim") then
  map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
  map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
  map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
  map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
end
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
-- map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- floating terminal
local lazyterm = function()
  Util.float_term(nil, { cwd = Util.get_root() })
end
map("n", "<leader>t", lazyterm, { desc = "Terminal (root dir)" })
map("n", "<leader>T", function()
  Util.float_term()
end, { desc = "Terminal (cwd)" })
-- map("n", "<c-/>", lazyterm, { desc = "Terminal (root dir)" })
-- map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })

-- Terminal Mappings
-- map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
-- map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
-- map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
-- map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
-- map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
-- map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- spectre
map("n", "<F1><cr>", function()
  require("spectre").open()
end, { desc = "Replace in files (Spectre)" })
map("n", "<F1>w", function()
  require("spectre").open_visual({ select_word = true })
end, { desc = "Replace current word in files (Spectre)" })
map("v", "<F1>w", function()
  require("spectre").open_visual()
end, { desc = "Replace selected word in files (Spectre)" })

-- flash
map("n", "<F4><cr>", function()
  require("flash").jump()
end, { desc = "Flash" })

-- -- highlights under cursor
-- if vim.fn.has("nvim-0.9.0") == 1 then
--   map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
-- end

-- telescope
local builtin = require("telescope.builtin")
map("n", "<F2><cr>", builtin.find_files, { desc = "Find files (telescope)" })
map("n", "<F2>g", builtin.live_grep, { desc = "Live grep (telescope)" })

-- nvim-lspconfig
map("n", "<leader>D", vim.diagnostic.open_float)
map("n", "<leader>dn", vim.diagnostic.goto_next)
map("n", "<leader>dp", vim.diagnostic.goto_prev)
map("n", "<leader>dl", vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    map("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Goto Declaration" })
    map("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Goto Definition" })
    map("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, desc = "Check References" })
    map("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover definition" })
    map("n", "<space>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename" })
    map({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code action" })
    map("n", "<space>fmt", function()
      vim.lsp.buf.format({ async = true })
    end, { buffer = ev.buf, desc = "Format" })
  end,
})

-- treesitter
-- :TSInstall <language>

-- notify
-- :Telescope notify
map("n", "<leader>no", function()
  require("notify").dismiss({ silent = true, pending = true })
end, { desc = "Dismiss all Notifications" })

local luasnip = require("luasnip")
-- luasnip
map("i", "<A-e>", function()
  if luasnip.expandable() then
    luasnip.expand()
    -- else
    --   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
  end
end, { desc = "Expand snippet", silent = true })

-- ufo
map("n", "<leader>fO", require("ufo").openAllFolds, { desc = "Open all folds" })
map("n", "<leader>fC", require("ufo").closeAllFolds, { desc = "Close all folds" })
map("n", "<leader>fc", "<cmd>:foldclose<cr>", { desc = "Close fold" })
map("n", "<leader>fo", "<cmd>:foldopen<cr>", { desc = "Open fold" })