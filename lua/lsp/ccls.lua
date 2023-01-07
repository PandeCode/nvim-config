NVIM_LSP.ccls.setup({
	on_attach = ON_ATTACH,
	capabilities = CAPABILITIES,
	flags = FLAGS,
	--
	init_options = {
		cache = {
			directory = vim.fn.expand("~/.cache/ccls")
		},
		compilationDatabaseDirectory = "build",
		index = {
			threads = 0,
		},
		clang = {
			excludeArgs = { "-frounding-math" },
		},
	},
})
