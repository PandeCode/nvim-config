local function cmp_i(i)
	return {
		function(cmp)
			cmp.accept { index = i }
		end,
	}
end

return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				"nvim-dap-ui",
				"blink.cmp",
				"lazy.nvim",
				"lualine.nvim",
				"mini.nvim",
				"snacks.nvim",
				"telescope.nvim",
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	{
		"saghen/blink.cmp",
		version = "v0.*",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"neovim/nvim-lspconfig",
			"folke/lazydev.nvim",
			"giuxtaposition/blink-cmp-copilot",
		},
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
				preset = "super-tab",

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
				ghost_text = {
					enabled = false,
				},

				menu = {
					draw = {
						treesitter = { "lsp", "buffer", "lazydev" },
						columns = { { "item_idx" }, { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },

						components = {

							item_idx = {
								text = function(ctx)
									return SUPERSCRIPTS[tostring(ctx.idx)]
								end,
								highlight = "BlinkCmpItemIdx",
							},
						},
					},
				},
			},

			sources = {
				default = {
					"copilot",
					"lsp",
					"luasnip",
					"path",
					"snippets",
					"buffer",
					"lazydev",
				},
				providers = {
					lsp = { fallback_for = { "lazydev" } },
					lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
					copilot = {
						name = "copilot",
						module = "blink-cmp-copilot",
						kind = "Copilot",
						score_offset = 100,
						async = true,
						transform_items = function(_, items)
							local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
							local kind_idx = #CompletionItemKind + 1
							CompletionItemKind[kind_idx] = "Copilot"
							for _, item in ipairs(items) do
								item.kind = kind_idx
							end
							return items
						end,
					},
				},
				appearance = {
					-- Blink does not expose its default kind icons so you must copy them all (or set your custom ones) and add Copilot
					kind_icons = {
						Copilot = "",
						Text = "󰉿",
						Method = "󰊕",
						Function = "󰊕",
						Constructor = "󰒓",

						Field = "󰜢",
						Variable = "󰆦",
						Property = "󰖷",

						Class = "󱡠",
						Interface = "󱡠",
						Struct = "󱡠",
						Module = "󰅩",

						Unit = "󰪚",
						Value = "󰦨",
						Enum = "󰦨",
						EnumMember = "󰦨",

						Keyword = "󰻾",
						Constant = "󰏿",

						Snippet = "󱄽",
						Color = "󰏘",
						File = "󰈔",
						Reference = "󰬲",
						Folder = "󰉋",
						Event = "󱐋",
						Operator = "󰪚",
						TypeParameter = "󰬛",
					},
				},

				-- per_filetype = { -- lua = { 'lsp', 'path' }, },
			},
		},
	},
}
