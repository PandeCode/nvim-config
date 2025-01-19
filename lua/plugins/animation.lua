if vim.g.vscode ~= nil or vim.g.neovide ~= nil or true then
	return {}
end

return {
	{
		"karb94/neoscroll.nvim",
		opts = {},
	},
	{
		"sphamba/smear-cursor.nvim",
		opts = {},
	},
}
