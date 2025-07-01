vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = "hyrpland.conf",
	callback = function()
		vim.cmd [[hyprctl reload]]
	end,
})
