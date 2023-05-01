require("flutter-tools").setup({
	lsp = {
		-- standalone file support
		-- setting it to false may improve startup time
		standalone = false,

		on_attach = function(client, bufnr)
			LSP.on_attach(client, bufnr)

			local opts = Keys.NoremapSilent
			opts.buffer = bufnr
			vim.keymap.set("n", "<leader>lo", function()
				vim.ui.select({
					"Run",
					"Devices",
					"Emulators",
					"Reload",
					"Restart",
					"Quit",
					"Detach",
					"OutlineToggle",
					"OutlineOpen",
					"DevTools",
					"DevToolsActivate",
					"CopyProfilerUrl",
					"DevTools",
					"LspRestart",
					"Super",
					"Reanalyze",
					"Rename",
				}, {
					prompt = "Flutter:",
					format_item = function(item)
						return "Flutter" .. item
					end,
				}, function(choice)
					vim.schedule(function()
						vim.cmd("Flutter" .. choice)
					end)
				end)
			end, opts)
		end,
		capabilities = LSP.capabilities,
		flags = LSP.flags,
	},
})
