-- https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim#api
local vscode = require("vscode-neovim")

local function f_vs_call(cmd)
	return function()
		vscode.call(cmd)
	end
end

vim.keymap.set(Keys.N, "<LEADER>nf", f_vs_call("editor.action.formartDocument.none"), Keys.None)
vim.keymap.set(Keys.V, "<LEADER>nf", f_vs_call("editor.action.formatSelection"), Keys.None)
