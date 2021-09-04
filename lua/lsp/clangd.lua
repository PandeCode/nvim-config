NVIM_LSP.clangd.setup {
	on_attach = ON_ATTACH,
	capabilities = CAPABILITIES,
	--
	cmd = {
		"clangd",
		"--background-index",
		"--enable-config",
		"--all-scopes-completion",
		"--clang-tidy",
		"--completion-style=bundled",
		"--malloc-trim",
		"--cross-file-rename",
		"--header-insertion=iwyu",
		"--limit-results=0",
		"--header-insertion-decorators"
	},

	filetypes = {"c", "cpp"}
}
