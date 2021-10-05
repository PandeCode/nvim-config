NVIM_LSP.yamlls.setup({
	on_attach = ON_ATTACH,
	capabilities = CAPABILITIES,
	flags = FLAGS,
	--
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml" },
	--settings = {}
	--root_dir = root_pattern(".git") or dirname}
})
