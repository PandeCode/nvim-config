NVIM_LSP.html.setup({
	on_attach = ON_ATTACH,
	capabilities = CAPABILITIES,
	flags = FLAGS,
	--
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html" },
	init_options = {
		configurationSection = { "html", "css", "javascriptreact", "typescriptreact", "tsx", "jsx", "vue", "svelte" },
		embeddedLanguages = {
			css = true,
			javascript = true,
		},
	},
	settings = {},
	--root_dir = function(fname) return root_pattern(fname) or vim.loop.os_homedir() end,
})
