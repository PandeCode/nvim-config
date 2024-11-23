neodev_not_loaded = true

vim.api.nvim_create_autocmd("BufRead", {
	pattern = { "*/nvim/**/*.lua" },
	callback = function()
		if neodev_not_loaded then
			require("neodev").setup({
				library = {
					plugins = { "nvim-dap-ui", "nvim-treesitter", "plenary.nvim", "telescope.nvim", "luasnip" },
					types = true,
				},
			})
			neodev_not_loaded = false
		end
	end,
})
