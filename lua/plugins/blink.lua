vim.keymap.set("n", "<leader>bo", function()
	vim.b.completion = not vim.b.completion
	if vim.b.completion then
		vim.notify "Enabled completion"
	else
		vim.notify("Disabled completion", "warn")
	end
end, { noremap = true, silent = true })

local function cmp_i(i)
	return {
		function(cmp)
			cmp.accept { index = i }
		end,
	}
end

return {
	{
		"justinsgithub/wezterm-types",
		event = {
			"BufReadPre wezterm/**.lua",
			"BufNewFile wezterm/**.lua",
		},
	},
	{
		"LelouchHe/xmake-luals-addon",
		event = {
			"BufReadPre xmake.lua",
			"BufNewFile xmake.lua",
		},
	},

	{
		"folke/lazydev.nvim",
		event = {
			"BufReadPre nvim/**.lua",
			"BufNewFile nvim/**.lua",
		},
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
				{ path = "wezterm-types", mods = { "wezterm" } },
				{ path = "xmake-luals-addon/library", files = { "xmake.lua" } },
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
		},
		---@type blink.cmp.Config
		opts = {
			signature = { window = { border = "single" } },
			snippets = { preset = "luasnip" },
			cmdline = {
				keymap = {
					preset = "super-tab",
				},
			},
			keymap = {


				-- stylua: ignore start
				preset         = "default",
				["<S-Tab>"]    = { "select_prev",               "snippet_backward", "fallback" },
				["<Tab>"]      = { "select_next",               "snippet_forward",  "fallback" },
				["<CR>"]       = { "accept",                    "fallback" },
				-- ["<Esc>"]      = { "hide",                      "fallback" },
				["<PageUp>"]   = { "scroll_documentation_up",   "fallback" },
				["<PageDown>"] = { "scroll_documentation_down", "fallback" },
				-- stylua: ignore end

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
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
			-- 	completion = {
			-- 		list = { selection = "manual" },
			-- 		ghost_text = {
			-- 			enabled = false,
			-- 		},
			--
			-- 		menu = {
			-- 			border = "rounded",
			-- 			draw = {
			-- 				treesitter = { "lsp", "buffer", "lazydev" },
			-- 				columns = {
			-- 					{ "item_idx" },
			-- 					{ "label", "label_description", gap = 1 },
			-- 					{ "kind_icon", "kind", gap = 1 },
			-- 				},
			--
			-- 				components = {
			-- 					kind_icon = {
			-- 						ellipsis = false,
			-- 						text = function(ctx)
			-- 							local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
			-- 							return kind_icon
			-- 						end,
			-- 						-- Optionally, you may also use the highlights from mini.icons
			-- 						highlight = function(ctx)
			-- 							local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
			-- 							return hl
			-- 						end,
			-- 					},
			-- 					item_idx = {
			-- 						text = function(ctx)
			-- 							return SUPERSCRIPTS[tostring(ctx.idx)] or SUPERSCRIPTS["1"] .. SUPERSCRIPTS["0"]
			-- 						end,
			-- 						highlight = "BlinkCmpItemIdx",
			-- 					},
			-- 				},
			-- 			},
			-- 		},
			-- 		documentation = { window = { border = "single" } },
			-- 	},
		},
	},
}
