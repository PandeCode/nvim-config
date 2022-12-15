NVIM_LSP.rust_analyzer.setup({
	on_attach = ON_ATTACH,
	capabilities = CAPABILITIES,
	flags = FLAGS,
	--
	handlers = {
	["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	-- Disable virtual_text
	virtual_text = true,
	}),
	},

	filetypes = { "rust" },
})
