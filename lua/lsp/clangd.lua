NVIM_LSP.clangd.setup {
	on_attach = ON_ATTACH,
	capabilities = CAPABILITIES,
	--
	cmd = {
		"clangd",
		"--background-index",
		"--enable-config",
		"--all-scopes-completion",
		"--clang-tidy",
		"--completion-style=bundled",
		"--malloc-trim",
		"--cross-file-rename",
		"--header-insertion=iwyu",
		"--limit-results=0",
		"--header-insertion-decorators"
	},

	filetypes = {"c", "cpp"}
}
--
-- NVIM_LSP.clangd.setup {
-- on_attach = function()
-- ON_ATTACH()

-- vim.api.nvim_buf_set_keymap(
-- 0, "n", "gs", "<Cmd>ClangdSwitchSourceHeader<CR>",
-- {noremap = true, silent = true}
-- )
-- end,
-- capabilities = CAPABILITIES,
----
-- cmd = {
-- "clangd",
-- "--background-index",
-- "--enable-config",
-- "--all-scopes-completion",
-- "--clang-tidy",
-- "--completion-style=bundled",
-- "--malloc-trim",
-- "--cross-file-rename",
-- "--header-insertion=iwyu",
-- "--limit-results=0",
-- "--header-insertion-decorators",
-- "--suggest-missing-includes",
-- "--clang-tidy",
-- "--clang-tidy-checks=-clang-analyzer-*," .. "bugprone-*," .. "misc-*," ..
-- "-misc-non-private-member-variables-in-classes," .. "performance-*," ..
-- "-performance-no-automatic-move," .. "modernize-use-*," ..
-- "-modernize-use-nodiscard," .. "-modernize-use-trailing-return-type"
-- },
-- init_options = {
-- clangdFileStatus = true,
-- usePlaceholders = true,
-- completeUnimported = true
-- },

-- filetypes = {"c", "cpp"}
-- }

-- NVIM_LSP.ccls.setup {
-- on_attach = ON_ATTACH,
-- capabilities = CAPABILITIES,
----
-- cmd = {"ccls"},

-- filetypes = {"c", "cpp"}
-- }
