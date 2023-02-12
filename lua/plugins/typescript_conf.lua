local ts = require("typescript")

ts.setup({
	disable_commands = false, -- prevent the plugin from creating Vim commands
	debug = false, -- enable debug logging for commands
	go_to_source_definition = {
		fallback = true, -- fall back to standard LSP definition on failure
	},
	server = { -- pass options to lspconfig's setup method
		on_attach = function(client, bufnr)
			LSP.on_attach(client, bufnr)

			local opts = Keys.NoremapSilent
			opts.buffer = bufnr

			vim.keymap.del("n", "<leader>gd", opts)

			vim.keymap.set("n", "<leader>tsi", ts.actions.addMissingImports, opts)
			vim.keymap.set("n", "<leader>tso", ts.actions.organizeImports, opts)
			vim.keymap.set("n", "<leader>tsr", ts.actions.removeUnused, opts)
			vim.keymap.set("n", "<leader>tsf", ts.actions.fixAll, opts)
			vim.keymap.set("n", "<leader>tsr", ":TypescriptRenameFile<cr>", opts)
			vim.keymap.set("n", "<leader>gd", ":TypescriptGoToSourceDefinition", opts)

		end,
		capabilities = LSP.capabilities,
		flags = LSP.flags,
	},
})
