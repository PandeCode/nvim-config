require("clangd_extensions").setup {
	server = {
--         -- options to pass to nvim-lspconfig
--         -- i.e. the arguments to require("lspconfig").clangd.setup({})
	on_attach = function(client, bufnr)
		ON_ATTACH(client, bufnr)

		vim.api.nvim_buf_set_keymap(bufnr, Keys.N, "<space>gh", "<Cmd>ClangdSwitchSourceHeader<CR>", Keys.NoremapSilent)
	end,
	capabilities = CAPABILITIES,
	flags = FLAGS;
	--
	cmd = {
		"clangd",
		"--all-scopes-completion",
		"--background-index",
		"--clang-tidy",
		"--completion-style=bundled",
		"--cross-file-rename",
		"--enable-config",
		"--header-insertion-decorators",
		"--header-insertion=iwyu",
		"--limit-results=0",
		"--malloc-trim",
	},

	filetypes = { "c", "cpp" },
--
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
	},
--     extensions = {
--         -- defaults:
--         -- Automatically set inlay hints (type hints)
--         autoSetHints = true,
--         -- These apply to the default ClangdSetInlayHints command
--         inlay_hints = {
--             -- Only show inlay hints for the current line
--             only_current_line = false,
--             -- Event which triggers a refersh of the inlay hints.
--             -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
--             -- not that this may cause  higher CPU usage.
--             -- This option is only respected when only_current_line and
--             -- autoSetHints both are true.
--             only_current_line_autocmd = "CursorHold",
--             -- whether to show parameter hints with the inlay hints or not
--             show_parameter_hints = true,
--             -- prefix for parameter hints
--             parameter_hints_prefix = "<- ",
--             -- prefix for all the other hints (type, chaining)
--             other_hints_prefix = "=> ",
--             -- whether to align to the length of the longest line in the file
--             max_len_align = false,
--             -- padding from the left if max_len_align is true
--             max_len_align_padding = 1,
--             -- whether to align to the extreme right or not
--             right_align = false,
--             -- padding from the right if right_align is true
--             right_align_padding = 7,
--             -- The color of the hints
--             highlight = "Comment",
--             -- The highlight group priority for extmark
--             priority = 100,
--         },
--         ast = {
--             role_icons = {
--                 type = "",
--                 declaration = "",
--                 expression = "",
--                 specifier = "",
--                 statement = "",
--                 ["template argument"] = "",
--             },
--
--             kind_icons = {
--                 Compound = "",
--                 Recovery = "",
--                 TranslationUnit = "",
--                 PackExpansion = "",
--                 TemplateTypeParm = "",
--                 TemplateTemplateParm = "",
--                 TemplateParamObject = "",
--             },
--
--             highlights = {
--                 detail = "Comment",
--             },
--         },
--         memory_usage = {
--             border = "none",
--         },
--         symbol_info = {
--             border = "none",
--         },
--     },
}
