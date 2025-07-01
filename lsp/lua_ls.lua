return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			signatureHelp = { enabled = true },
			telemetry = { enable = false },
			checkThirdParty = true,
			completion = {
				callSnippet = "Replace",
				keywordSnippet = "Both",
				workspaceWord = true,
			},
		},
	},
}
