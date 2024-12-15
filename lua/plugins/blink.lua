local function cmp_i(i)
	return {
		function(cmp)
			cmp.accept { index = i }
		end,
	}
end

return {
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
		"saghen/blink.cmp",
		version = "v0.*",
		dependencies = { "L3MON4D3/LuaSnip", "neovim/nvim-lspconfig" },
		opts = {
			appearance = { nerd_font_variant = "mono" },
			signature = { enabled = true },
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
				preset = "enter",

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

			completion = {
				menu = {
					draw = {
						columns = { { "item_idx" }, { "kind_icon" }, { "label", "label_description", gap = 1 } },
						components = {
							item_idx = {
								text = function(ctx)
									return tostring(ctx.idx)
								end,
								highlight = "BlinkCmpItemIdx",
							},
						},
					},
				},
			},

			sources = {
				default = { "lsp", "luasnip", "path", "snippets", "buffer", "lazydev" },
				providers = {
					-- dont show LuaLS require statements when lazydev has items
					lsp = { fallback_for = { "lazydev" } },
					lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
				},
			},
		},
	},
}
