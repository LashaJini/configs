vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, noremap = true })
-- vim.g.mapleader = "<Space>"
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>R", ":source $HOME/.config/nvim/vscode/init.lua<cr>", { silent = true })

-- vim.keymap.set("n", "<leader>\\", ":vsplit<cr>", { noremap = true })
-- vim.keymap.set("n", "<leader>-", ":split<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })

local vscode = require("vscode")
print(vscode.call("_ping")) -- outputs: pong
-- print(vscode.call("_ping")) -- outputs: pong

-- vim.keymap.set({ "n", "x" }, "<leader>r", function()
--   vscode.with_insert(function()
--     vscode.action("editor.action.refactor")
--   end)
-- end)

vim.keymap.set("n", "<leader>dn", function()
  vscode.action("editor.action.marker.next")
end)

vim.keymap.set("n", "<leader>dp", function()
  vscode.action("editor.action.marker.prev")
end)

vim.keymap.set("n", "<leader>rn", function()
  vscode.action("editor.action.rename")
end)
