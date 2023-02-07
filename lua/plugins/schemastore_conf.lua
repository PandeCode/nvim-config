LSP.lspconfig.jsonls.setup({
	on_attach = LSP.on_attach,
	capabilities = LSP.capabilities,
	flags = LSP.flags,

	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})
