local function cmp_i(i)
	return {
		function(cmp)
			cmp.accept { index = i }
		end,
	}
end

return {
	"neovim/nvim-lspconfig",
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load() -- For friendly-snippets
			require("luasnip.loaders.from_vscode").lazy_load { paths = vim.fn.expand "~/.config/nvim/snippets" }
		end,
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "v2.*",
		build = "make install_jsregexp",
	},

	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				"lazy.nvim",
				"blink.cmp",
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
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

	{
		"saghen/blink.cmp",
		version = "v0.7.3",
		dependencies = { "L3MON4D3/LuaSnip", "neovim/nvim-lspconfig", "ray-x/lsp_signature.nvim" },

		opts = {
			servers = {
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
			},
			config = function(_, opts)
				vim.api.nvim_create_autocmd("LspAttach", {
					callback = function(args)
						local bufnr = args.buf
						local client = vim.lsp.get_client_by_id(args.data.client_id)
						if vim.tbl_contains({ "null-ls" }, client.name) then -- blacklist lsp
							return
						end
						require("lsp_signature").on_attach({
							-- ... setup options here ...
						}, bufnr)
					end,
				})

				local lspconfig = require "lspconfig"
				for server, config in pairs(opts.servers) do
					-- passing config.capabilities to blink.cmp merges with the capabilities in your
					-- `opts[server].capabilities, if you've defined it
					config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
					lspconfig[server].setup(config)
				end
			end,
			snippets = {
				expand = function(snippet)
					require("luasnip").lsp_expand(snippet)
				end,
				active = function(filter)
					if filter and filter.direction then
						return require("luasnip").jumpable(filter.direction)
					end
					return require("luasnip").in_snippet()
				end,
				jump = function(direction)
					require("luasnip").jump(direction)
				end,
			},
			keymap = {

				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide", "fallback" },

				["<Tab>"] = {
					function(cmp)
						if cmp.snippet_active() then
							return cmp.accept()
						else
							return cmp.select_and_accept()
						end
					end,
					"snippet_forward",
					"fallback",
				},
				["<S-Tab>"] = { "snippet_backward", "fallback" },

				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },

				["<C-p>"] = { "select_prev", "fallback" },
				["<C-n>"] = { "select_next", "fallback" },

				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },

				["<A-1>"] = cmp_i(1),
				["<A-2>"] = cmp_i(2),
				["<A-3>"] = cmp_i(3),
				["<A-4>"] = cmp_i(4),
				["<A-5>"] = cmp_i(5),
				["<A-6>"] = cmp_i(6),
				["<A-7>"] = cmp_i(7),
				["<A-8>"] = cmp_i(8),
				["<A-9>"] = cmp_i(9),
			},
			sources = {
				completion = {
					enabled_providers = { "lsp", "luasnip", "path", "snippets", "buffer", "lazydev" },
					menu = {
						draw = {

							columns = { { "item_idx" }, { "kind_icon" }, { "label", "label_description", gap = 1 } },

							components = {
								item_idx = {
									text = function(ctx)
										return tostring(ctx.idx)
									end,
									highlight = "BlinkCmpItemIdx", -- optional, only if you want to change its color
								},
							},
						},
					},
				},
				providers = {
					-- dont show LuaLS require statements when lazydev has items
					lsp = { fallback_for = { "lazydev" } },
					lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
				},
			},
		},
	},
}
