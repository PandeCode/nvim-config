LSP.lspconfig.pyright.setup({
	on_attach = LSP.on_attach,
	lsp_flags = LSP.lsp_flags,
	capabilities = LSP.capabilities,

	settings = {
		python = {
			analysis = {
				autoSearchPaths = true, -- Used to automatically add search paths based on some predefined names (like src).
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
				stubPath = vim.fn.expand("~/.cache/typings"),
				typeCheckingMode = "basic", -- Used to specify the level of type checking analysis performed.
			},
		},
	},
})
