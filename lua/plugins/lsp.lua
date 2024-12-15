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
	vim = {},
	vimls = {},
	vls = {},
	yamlls = {},
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
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
		"neovim/nvim-lspconfig",
		dependencies = { "ray-x/lsp_signature.nvim" },
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if vim.tbl_contains({ "null-ls" }, client.name) then -- blacklist lsp
						return
					end
					require("lsp_signature").on_attach({}, bufnr)
				end,
			})

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
		opts = {
			bind = true,
			handler_opts = {
				border = "rounded",
			},
		},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
}
