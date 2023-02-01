-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<LEADER>e", vim.diagnostic.open_float, Keys.NoremapSilent)
vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, Keys.NoremapSilent)
vim.keymap.set("n", "g]", vim.diagnostic.goto_next, Keys.NoremapSilent)
vim.keymap.set("n", "<LEADER>q", vim.diagnostic.setloclist, Keys.NoremapSilent)

vim.keymap.set("n", "<LEADER>li", ":LspInfo<CR>", Keys.NoremapSilent)
vim.keymap.set("n", "<LEADER>lq", ":LspStop<CR>", Keys.NoremapSilent)
vim.keymap.set("n", "<LEADER>lr", ":LspRestart<CR>", Keys.NoremapSilent)
vim.keymap.set("n", "<LEADER>ls", ":LspStart<CR>", Keys.NoremapSilent)

LSP = {
	lspconfig = require("lspconfig"),
	on_attach = function(client, bufnr)
		-- Enable completion triggered by <c-x><c-o>
		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

		-- Mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local bufopts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
		vim.keymap.set("n", "<LEADER>wa", vim.lsp.buf.add_workspace_folder, bufopts)
		vim.keymap.set("n", "<LEADER>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
		vim.keymap.set("n", "<LEADER>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, bufopts)
		vim.keymap.set("n", "<LEADER>D", vim.lsp.buf.type_definition, bufopts)
		vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, bufopts)
		vim.keymap.set("n", "<LEADER>ca", vim.lsp.buf.code_action, bufopts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
		vim.keymap.set("n", "<LEADER>f", function()
			vim.lsp.buf.format({ async = true })
		end, bufopts)
	end,
	lsp_flags = {
		-- This is the default in Nvim 0.7+
		debounce_text_changes = 150,
	},
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

RequireForFileType("lua", "plugins.lsp.lua_conf")
