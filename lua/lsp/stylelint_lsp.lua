NVIM_LSP.stylelint_lsp.setup({
	on_attach = ON_ATTACH,
	capabilities = CAPABILITIES,
	flags = FLAGS,
	--
	cmd = { "stylelint-lsp", "--stdio" },
	filetypes = {
		"css",
		"less",
		"scss",
		"sugarss",
		"vue",
		"wxss",
		"jsx",
		"javascript",
		"javascriptreact",
		"tsx",
		"typescript",
		"typescriptreact",
		"svelte",
		"vue"
	},
	settings = {
		autoFixOnFormat = false,
		autoFixOnSave = false,
		config = nil,
		configFile = nil,
		configOverrides = nil,
		enable = true,
		validateOnSave = false,
		validateOnType = true,
	},

	--root_dir =  root_pattern('.stylelintrc', 'package.json')
})
