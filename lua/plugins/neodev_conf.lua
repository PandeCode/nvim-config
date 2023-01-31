vim.api.nvim_create_autocmd("BufRead", {
	pattern = { "*/nvim/**/*.lua" },
	callback = function()
		require("neodev").setup({
			library = { plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" } },
		})
	end,
})
