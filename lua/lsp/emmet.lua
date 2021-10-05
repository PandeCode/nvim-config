local configs = require("lspconfig/configs")

if not NVIM_LSP.emmet_ls then
	configs.emmet_ls = {
		default_config = {
			cmd = { "emmet-ls", "--stdio" },
			filetypes = {
				"html",
				"css",
				"jsx",
				"tsx",
				"javascriptreact",
				"typescriptreact",
				"text",
				"txt",
			},
			root_dir = function(fname)
				return vim.loop.cwd()
			end,
			settings = {},
		},
	}
end

NVIM_LSP.emmet_ls.setup({ capabilities = CAPABILITIES, flags = FLAGS })
