vim.api.nvim_create_autocmd("BufRead", {
	pattern = { "*/nvim/**/*.lua" },
	callback = function()
		require("neodev").setup({})
	end,
})
