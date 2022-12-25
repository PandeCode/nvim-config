NVIM_LSP.glslls.setup({
	on_attach = ON_ATTACH,
	capabilities = CAPABILITIES,
	flags = FLAGS,

	-- cmd = { "glslls", "--stdin" },
	filetypes = { "glsl", "hlsl", "vert", "frag" },
	root_dir = function(fname) return vim.loop.cwd() end,
	-- single_file_support = true,
	-- settings = {},
})
