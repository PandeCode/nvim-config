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
			-- vim.keymap.del("n", "<leader>gd", opts)
			opts.buffer = bufnr

			vim.keymap.set("n", "<leader>gd", ":TypescriptGoToSourceDefinition", opts)
			vim.keymap.set("n", "<leader>ts", function()
				vim.ui.select({
					"FixAll",
					"RenameFile",
					"RemoveUnused",
					"OrganizeImports",
					"AddMissingImports",
					"GoToSourceDefinition",
				}, {
					prompt = "Typescript:",
					format_item = function(item)
						return "Typescript" .. item
					end,
				}, function(choice)
					vim.schedule(function()
						vim.cmd("Typescript" .. choice)
					end
					)
				end)
			end, opts)
		end,
		capabilities = LSP.capabilities,
		flags = LSP.flags,
	},
})
