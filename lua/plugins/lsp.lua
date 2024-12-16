vim.keymap.set("n", "<LEADER>e", function()
	vim.diagnostic.open_float { float = "rounded" }
end, { noremap = true, silent = true })
vim.keymap.set("n", "g[", function()
	vim.diagnostic.goto_prev { float = "rounded" }
end, { noremap = true, silent = true })
vim.keymap.set("n", "g]", function()
	vim.diagnostic.goto_next { float = "rounded" }
end, { noremap = true, silent = true })
vim.keymap.set("n", "<LEADER>q", "<CMD>Telescope diagnostics<CR>", { noremap = true, silent = true })

local servers = {
	ast_grep = {},
	awk_ls = {},
	bashls = {},
	cssls = {},
	cssmodules_ls = {},
	gdscript = {},
	glsl_analyzer = {},
	gopls = {},
	hls = {},
	html = {},
	neocmake = {},
	nil_ls = {},
	tailwindcss = {},
	vimls = {},
	vls = {},
	yamlls = {},
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = { globals = { "vim", "FFI_RUST", "Snacks" } },
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
				telemetry = { enable = false },
				completion = {
					callSnippet = "Replace",
					keywordSnippet = "Both",
					workspaceWord = true,
				},
			},
		},
	},
	rust_analyzer = {
		-- cmd = { "rust-analyzer" },
		cmd = vim.lsp.rpc.connect("127.0.0.1", 27631),
		settings = {
			["rust-analyzer"] = {
				lspMux = {
					version = "1",
					method = "connect",
					server = "rust-analyzer",
				},
				diagnostics = {
					enable = false,
				},
			},
		},
	},
	pyright = {
		-- basedpyright = {
		settings = {
			python = {
				analysis = {
					autoSearchPaths = true, -- Used to automatically add search paths based on some predefined nam es (like src).
					diagnosticMode = "openFilesOnly",
					useLibraryCodeForTypes = true,
					stubPath = vim.fn.expand "~/.cache/typings",
					typeCheckingMode = "basic", -- Used to specify the level of type checking analysis performed.
				},
			},
		},
	},
}

return {
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup {}
			-- require("lspsaga.symbol.winbar").get_bar()
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if vim.tbl_contains({ "null-ls" }, client.name) then -- blacklist lsp
						return
					end
					require("lsp_signature").on_attach({}, bufnr)

					-- Mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local bufopts = { noremap = true, silent = true, buffer = bufnr }

					vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)

					vim.keymap.set("n", "<LEADER>D", vim.lsp.buf.type_definition, bufopts)

					vim.keymap.set("n", "<F2>", "<CMD>Lpsaga rename<CR>", bufopts)
					vim.keymap.set("n", "<LEADER>ca", "<CMD>Lspsaga code_action<CR>", bufopts)
					vim.keymap.set("n", "<LEADER>gp", "<CMD>Lspsaga peek_definition<CR>", bufopts)
					vim.keymap.set("n", "<LEADER>gP", "<CMD>Lspsaga peek_type_definition<CR>", bufopts)
					vim.keymap.set("n", "<LEADER>gd", "<CMD>Lspsaga goto_definition<CR>", bufopts)
					vim.keymap.set("n", "<LEADER>gD", "<CMD>Lspsaga goto_type_definition<CR>", bufopts)

					vim.keymap.set("n", "<LEADER>lf", "<CMD>Lspsaga finder tyd+ref+imp+def<CR>", bufopts)
				end,
			})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "ray-x/lsp_signature.nvim" },
		config = function()
			local lspconfig = require "lspconfig"
			for server, config in pairs(servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		config = function()
			require("lsp_signature").setup {
				bind = true,
				handler_opts = {
					border = "rounded",
				},
			}
		end,
	},
}
