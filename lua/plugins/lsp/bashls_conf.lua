LSP.lspconfig.bashls.setup({
	on_attach = LSP.on_attach,
	lsp_flags = LSP.lsp_flags,
	capabilities = LSP.capabilities,

	filetypes = {"sh", "bash"}
})
