-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<LEADER>e", function()
	vim.diagnostic.open_float({ float = "rounded" })
end, Keys.NoremapSilent)
vim.keymap.set("n", "g[", function()
	vim.diagnostic.goto_prev({ float = "rounded" })
end, Keys.NoremapSilent)
vim.keymap.set("n", "g]", function()
	vim.diagnostic.goto_next({ float = "rounded" })
end, Keys.NoremapSilent)
vim.keymap.set("n", "<LEADER>q", "<CMD>Telescope diagnostics<CR>", Keys.NoremapSilent)

vim.keymap.set("n", "<LEADER>li", ":LspInfo<CR>", Keys.NoremapSilent)
vim.keymap.set("n", "<LEADER>lq", ":LspStop<CR>", Keys.NoremapSilent)
vim.keymap.set("n", "<LEADER>lr", ":LspRestart<CR>", Keys.NoremapSilent)
vim.keymap.set("n", "<LEADER>ls", ":LspStart<CR>", Keys.NoremapSilent)

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

local old_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = "rounded"
	return  old_open_floating_preview(contents, syntax, opts, ...)
end

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
		vim.keymap.set("n", "<C-S-k>", vim.lsp.buf.signature_help, bufopts)
		vim.keymap.set("n", "<LEADER>wa", vim.lsp.buf.add_workspace_folder, bufopts)
		vim.keymap.set("n", "<LEADER>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
		vim.keymap.set("n", "<LEADER>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, bufopts)
		vim.keymap.set("n", "<LEADER>D", vim.lsp.buf.type_definition, bufopts)
		vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, bufopts)
		vim.keymap.set("n", "<LEADER>ca", vim.lsp.buf.code_action, bufopts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
		vim.keymap.set("n", "<LEADER>cf", function()
			vim.lsp.buf.format({ async = true })
		end, bufopts)
	end,
	lsp_flags = {
		-- This is the default in Nvim 0.7+
		debounce_text_changes = 150,
	},
	capabilities = capabilities,
}

local function default_config(server_name, filetypes, settings)
	return function()
		LSP.lspconfig[server_name].setup({
			on_attach = LSP.on_attach,
			lsp_flags = LSP.lsp_flags,
			capabilities = LSP.capabilities,
			filetypes = filetypes,
			settings = settings,
		})
	end
end
local function lsp_RunForFileType(ft, server_name)
	RunForFileType(ft, default_config(server_name, ft))
end

RequireForFileType("lua", "plugins.lsp.lua_conf")
RequireForFileType("python", "plugins.lsp.python_conf")

lsp_RunForFileType({ "awk" }, "awk_ls")
lsp_RunForFileType({
	"html",
	"css",
	"less",
	"postcss",
	"sass",
	"scss",
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
}, "tailwindcss")
lsp_RunForFileType({ "go", "gomod", "gowork", "gotmpl" }, "gopls")
lsp_RunForFileType({ "sh", "bash" }, "bashls")
lsp_RunForFileType({ "cmake" }, "neocmake")
lsp_RunForFileType({ "css", "scss", "less" }, "cssls")
lsp_RunForFileType({ "html" }, "html")
lsp_RunForFileType({ "javascript", "javascriptreact", "typescript", "typescriptreact" }, "cssmodules_ls")
lsp_RunForFileType({ "vlang" }, "vls")
lsp_RunForFileType({ "vim" }, "vim")
