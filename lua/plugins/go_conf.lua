require("go").setup({
	luasnip = true,
	-- goimport = 'gopls', -- if set to 'gopls' will use golsp format
	-- gofmt = 'gopls', -- if set to gopls will use golsp format
	max_line_len = 120,
	tag_transform = false,
	test_dir = "",
	comment_placeholder = "   ",
	lsp_cfg = false, -- false: use your own lspconfig
	lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
	lsp_on_attach = true, -- use on_attach from go.nvim
	dap_debug = true,
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.go",
	callback = function(tbl)
		vim.keymap.set("n", "<leader>lo", function()
			vim.ui.select(
				{
					"Alt",
					"Cmt",
					"Doc",
					"Env",
					"Fmt",
					"Get",
					"Run",
					"Vet",
					"mvp",
					"AltS",
					"AltV",
					"Enum",
					"Impl",
					"Lint",
					"Make",
					"Stop",
					"Test",
					"Build",
					"Cheat",
					"Debug",
					"IfErr",
					"RmTag",
					"AddTag",
					"Import",
					"Rename",
					"AddTest",
					"Channel",
					"DbgKeys",
					"DbgStop",
					"MockGen",
					"ModInit",
					"ModTidy",
					"Project",
					"TestPkg",
					"TestSum",
					"ClearTag",
					"Coverage",
					"Generate",
					"TestFile",
					"TestFunc",
					"BreakLoad",
					"BreakSave",
					"Callstack",
					"DbgConfig",
					"GenReturn",
					"ModVendor",
					"ModifyTag",
					"vulnckeck",
					"AddAllTest",
					"AddExpTest",
					"CodeAction",
					"CodeLenAct",
					"FillStruct",
					"FillSwitch",
					"FixPlurals",
					"PkgOutline",
					"BreakToggle",
					"DbgContinue",
					"Json2Struct",
					"ListImports",
					"TestSubCase",
					"ToggleInlay",
					"CreateLaunch",
					"CreateLaunch",
					"UpdateBinary",
					"InstallBinary",
					"UpdateBinaries",
					"InstallBinaries",
				},
				{
					prompt = "Go:",
					format_item = function(item)
						return "Go" .. item
					end,
				},
				function(choice)
					vim.schedule(function()
						vim.cmd("Go" .. choice)
					end)
				end
			)
		end, { buffer = tbl.bufnr })
	end,
})
