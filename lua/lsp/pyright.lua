NVIM_LSP.pyright.setup({
	on_attach = ON_ATTACH,
	capabilities = CAPABILITIES,
	flags = FLAGS,
	--
	cmd = { "pyright-langserver", "--stdio" },
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true, -- Used to automatically add search paths based on some predefined names (like src).
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
				stubPath = vim.fn.expand("~") .. "/.cache/typings",
				typeCheckingMode = "strict", -- Used to specify the level of type checking analysis performed.
			},
		},
	},
})

--NVIM_LSP.pylsp.setup {
--on_attach = ON_ATTACH,
--capabilities = CAPABILITIES,
----
--cmd = {"pylsp"},
--filetypes = {"python"}
----root_dir = function(fname)
----local root_files = {
----'pyproject.toml',
----'setup.py',
----'setup.cfg',
----'requirements.txt',
----'Pipfile',
----}
----return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
----end,
--}

--NVIM_LSP.jedi_language_server.setup {
--on_attach = ON_ATTACH,
--capabilities = CAPABILITIES,
----
--cmd = {"jedi-language-server"},
--filetypes = {"python"}
----root_dir = vim's starting directory,
--}
