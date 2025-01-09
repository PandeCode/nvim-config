local M = {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		lazy = false,
		keys = {
			{ "<LEADER>1", "<CMD>BufferLineGoToBuffer 1<CR>" },
			{ "<LEADER>2", "<CMD>BufferLineGoToBuffer 2<CR>" },
			{ "<LEADER>3", "<CMD>BufferLineGoToBuffer 3<CR>" },
			{ "<LEADER>4", "<CMD>BufferLineGoToBuffer 4<CR>" },
			{ "<LEADER>5", "<CMD>BufferLineGoToBuffer 5<CR>" },
			{ "<LEADER>6", "<CMD>BufferLineGoToBuffer 6<CR>" },
			{ "<LEADER>7", "<CMD>BufferLineGoToBuffer 7<CR>" },
			{ "<LEADER>8", "<CMD>BufferLineGoToBuffer 8<CR>" },
			{ "<LEADER>9", "<CMD>BufferLineGoToBuffer 9<CR>" },
		},
		opts = {
			options = {
				diagnostics = "nvim_lsp",
				-- separator_style = { "slant", "slope" },
				separator_style = "slope",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and " " or (e == "warning" and " " or " ")
						s = s .. n .. sym
					end
					return s
				end,
			},
		},
	},

	"hiphish/rainbow-delimiters.nvim",

	{
		"rachartier/tiny-devicons-auto-colors.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = "VeryLazy",
		config = function()
			require("tiny-devicons-auto-colors").setup { colors = ToList(require "tokyonight.colors.night") }
		end,
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = { style = "night" },
		config = function()
			vim.cmd [[colorscheme tokyonight-night ]]

			IsTransparent = false
			function ToggleBackground()
				if IsTransparent then
					vim.cmd "hi Normal guifg=#c0caf5 guibg=#1a1b26 | hi LineNr ctermfg=11 guifg=#3b4261| hi SignColumn ctermfg=14 ctermbg=242 guifg=#3b4261 guibg=#1a1b26"
					IsTransparent = false
				else
					vim.cmd [[hi Normal ctermbg=NONE guibg=NONE | hi LineNr ctermbg=NONE guibg=NONE | hi SignColumn ctermbg=NONE guibg=NONE]]
					IsTransparent = true
				end
			end

			vim.keymap.set("n", "<LEADER>bt", ToggleBackground, { noremap = true, silent = true })
			ToggleBackground()
		end,
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					-- ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				-- bottom_search = false, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},

	{
		"lewis6991/hover.nvim",
		config = function()
			require("hover").setup {
				init = function()
					-- Require providers
					require "hover.providers.lsp"
					require "hover.providers.diagnostic"
					require "hover.providers.gh"
					require "hover.providers.gh_user"
					-- require('hover.providers.jira')
					require "hover.providers.dap"
					require "hover.providers.fold_preview"
					require "hover.providers.man"
					require "hover.providers.dictionary"
				end,
				preview_opts = {
					border = "single",
				},
				-- Whether the contents of a currently open hover window should be moved
				-- to a :h preview-window when pressing the hover keymap.
				preview_window = false,
				title = true,
				mouse_providers = {
					"LSP",
				},
				mouse_delay = 500,
			}

			-- Setup keymaps
			vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
			vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
			vim.keymap.set("n", "<C-p>", function()
				require("hover").hover_switch "previous"
			end, { desc = "hover.nvim (previous source)" })
			vim.keymap.set("n", "<C-n>", function()
				require("hover").hover_switch "next"
			end, { desc = "hover.nvim (next source)" })

			-- Mouse support
			vim.keymap.set("n", "<MouseMove>", require("hover").hover_mouse, { desc = "hover.nvim (mouse)" })
			vim.o.mousemoveevent = true
		end,
	},
	---@module "neominimap.config.meta"
	{
		"Isrothy/neominimap.nvim",
		version = "v3.*.*",
		lazy = true,
		keys = {
			-- Global Minimap Controls
			{ "<leader>nm", "<cmd>Neominimap toggle<cr>", desc = "Toggle global minimap" },
			{ "<leader>no", "<cmd>Neominimap on<cr>", desc = "Enable global minimap" },
			{ "<leader>nc", "<cmd>Neominimap off<cr>", desc = "Disable global minimap" },
			{ "<leader>nr", "<cmd>Neominimap refresh<cr>", desc = "Refresh global minimap" },

			-- Window-Specific Minimap Controls
			{ "<leader>nwt", "<cmd>Neominimap winToggle<cr>", desc = "Toggle minimap for current window" },
			{ "<leader>nwr", "<cmd>Neominimap winRefresh<cr>", desc = "Refresh minimap for current window" },
			{ "<leader>nwo", "<cmd>Neominimap winOn<cr>", desc = "Enable minimap for current window" },
			{ "<leader>nwc", "<cmd>Neominimap winOff<cr>", desc = "Disable minimap for current window" },

			-- Tab-Specific Minimap Controls
			{ "<leader>ntt", "<cmd>Neominimap tabToggle<cr>", desc = "Toggle minimap for current tab" },
			{ "<leader>ntr", "<cmd>Neominimap tabRefresh<cr>", desc = "Refresh minimap for current tab" },
			{ "<leader>nto", "<cmd>Neominimap tabOn<cr>", desc = "Enable minimap for current tab" },
			{ "<leader>ntc", "<cmd>Neominimap tabOff<cr>", desc = "Disable minimap for current tab" },

			-- Buffer-Specific Minimap Controls
			{ "<leader>nbt", "<cmd>Neominimap bufToggle<cr>", desc = "Toggle minimap for current buffer" },
			{ "<leader>nbr", "<cmd>Neominimap bufRefresh<cr>", desc = "Refresh minimap for current buffer" },
			{ "<leader>nbo", "<cmd>Neominimap bufOn<cr>", desc = "Enable minimap for current buffer" },
			{ "<leader>nbc", "<cmd>Neominimap bufOff<cr>", desc = "Disable minimap for current buffer" },

			---Focus Controls
			{ "<leader>nf", "<cmd>Neominimap focus<cr>", desc = "Focus on minimap" },
			{ "<leader>nu", "<cmd>Neominimap unfocus<cr>", desc = "Unfocus minimap" },
			{ "<leader>ns", "<cmd>Neominimap toggleFocus<cr>", desc = "Switch focus on minimap" },
		},
		init = function()
			-- The following options are recommended when layout == "float"
			-- vim.opt.wrap = false
			-- vim.opt.sidescrolloff = 36 -- Set a large value

			--- Put your configuration here
			---@type Neominimap.UserConfig
			vim.g.neominimap = {
				auto_enable = false,
			}
		end,
	},
}

return M
