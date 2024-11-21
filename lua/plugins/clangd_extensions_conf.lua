LSP.lspconfig["clangd"].setup({
	filetypes = { "c", "cpp", "cxx", "cc", "hpp", "h", "hxx" },
	root_dir = LSP.lspconfig.util.root_pattern(
		".git",
		"premake5.lua",
		"cmake",
		"Makefile",
		"CMakeLists.txt",
		"compile_commands.json"
	),
	on_attach = function(client, bufnr)
		LSP.on_attach(client, bufnr)

		local group = vim.api.nvim_create_augroup("clangd_no_inlay_hints_in_insert", { clear = true })

		vim.keymap.set("n", "<leader>lh", function()
			if require("clangd_extensions.inlay_hints").toggle_inlay_hints() then
				vim.api.nvim_create_autocmd("InsertEnter", {
					group = group,
					buffer = buf,
					callback = require("clangd_extensions.inlay_hints").disable_inlay_hints,
				})
				vim.api.nvim_create_autocmd(
					{ "TextChanged", "InsertLeave" },
					{ group = group, buffer = buf, callback = require("clangd_extensions.inlay_hints").set_inlay_hints }
				)
			else
				vim.api.nvim_clear_autocmds({ group = group, buffer = buf })
			end
		end, { buffer = buf, desc = "[l]sp [h]ints toggle" })

		vim.api.nvim_buf_set_keymap(bufnr, Keys.N, "<space>gh", "<Cmd>ClangdSwitchSourceHeader<CR>", Keys.NoremapSilent)

		vim.keymap.set("n", "<leader>lo", function()
			vim.ui.select({
				"ClangAST",
				"ClangdSymbolInfo",
				"ClangdMemoryUsage",
				"ClangdSetInlayHints",
				"ClangdTypeHierarchy",
				"ClangdToggleInlayHints",
				"ClangdDisableInlayHints",
				"ClangdSwitchSourceHeader",
			}, {
				prompt = "C/C++:",
			}, function(choice)
				vim.schedule(function()
					vim.cmd(choice)
				end)
			end)
		end, { buffer = bufnr })
	end,
	capabilities = LSP.capabilities,
	flags = LSP.flags,
	cmd = {
		"clangd",
		"--all-scopes-completion",
		"--background-index",
		"--clang-tidy",
		-- "--completion-style=bundled",
		"--cross-file-rename",
		-- "--enable-config",
		-- "--header-insertion-decorators",
		-- "--header-insertion=iwyu",
		-- "--limit-results=0",
		-- "--malloc-trim",
	},
})

require("clangd_extensions").setup({

	ast = {
		role_icons = {
			type = "",
			declaration = "",
			expression = "",
			specifier = "",
			statement = "",
			["template argument"] = "",
		},

		kind_icons = {
			Compound = "",
			Recovery = "",
			TranslationUnit = "",
			PackExpansion = "",
			TemplateTypeParm = "",
			TemplateTemplateParm = "",
			TemplateParamObject = "",
		},
	},

	memory_usage = { border = "rounded" },
	symbol_info = { border = "rounded" },
})
