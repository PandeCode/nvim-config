NVIM_LSP.emmet_ls.setup({
	capabilities = CAPABILITIES,
	flags = FLAGS,

	cmd = { "emmet-ls", "--stdio" },
	filetypes = {
		"html",
		"css",
		"jsx",
		"tsx",
		"javascriptreact",
		"typescriptreact",
		"text",
		"txt",
		"rust",
	},
	root_dir = function(fname)
		return vim.loop.cwd()
	end,
	settings = {
		includeLanguages = {
			rust = "html",
		},
	},
})
