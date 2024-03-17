Prequire("config.autocmds")
Prequire("config.bindings")
Prequire("config.commands")
Prequire("config.options")

if vim.g.neovide then
	Prequire("config.neovide")
end

if vim.g.vscode then
	Prequire("config.vscode")
end
