NVIM_LSP.tsserver.setup({
	on_attach = ON_ATTACH,
	capabilities = CAPABILITIES,
	flags = FLAGS,
	--
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"svelte",
		"vue",
		"tsx",
		"jsx",
	},
	init_options = {
		hostInfo = "neovim",
	},

	--root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
})
