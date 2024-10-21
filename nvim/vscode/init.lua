vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, noremap = true })
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>R", ":source $HOME/.config/nvim/vscode/init.lua<cr>", { silent = true })

local vscode = require("vscode")
print(vscode.call("_ping")) -- outputs: pong

vim.keymap.set("n", "<leader>dn", function()
  vscode.action("editor.action.marker.next")
end)

vim.keymap.set("n", "<leader>dp", function()
  vscode.action("editor.action.marker.prev")
end)

vim.keymap.set("n", "<leader>rn", function()
  vscode.action("editor.action.rename")
end)

--
-- FILES
--
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", function()
  vscode.action("workbench.action.closeActiveEditor")
end)

--
-- WINDOWS
--
vim.keymap.set("n", "<leader>-", function()
  vscode.action("workbench.action.splitEditorDown")
end)

vim.keymap.set("n", "<leader>\\", function()
  vscode.action("workbench.action.splitEditorRight")
end)

--
-- SIDEBAR
--
vim.keymap.set("n", "<leader>nn", function()
  vscode.action("workbench.action.toggleSidebarVisibility")
end)
