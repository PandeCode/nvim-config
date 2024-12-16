local M = {
	{
		"nvim-treesitter/playground",
		cmd = "TSPlayground",
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update { with_sync = true }()
		end,
		config = function()
			local configs = require "nvim-treesitter.configs"

			configs.setup {
				ensure_installed = {
					"asm",
					"bash",
					"c",
					"cpp",
					"csv",
					"fish",
					"git_config",
					"git_rebase",
					"gitattributes",
					"gitcommit",
					"gitignore",
					"glsl",
					"heex",
					"html",
					"javascript",
					"json",
					"json5",
					"latex",
					"lua",
					"luadoc",
					"luau",
					"make",
					"make",
					"markdown",
					"markdown_inline",
					"nix",
					"nu",
					"powershell",
					"python",
					"query",
					"rust",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			}
		end,
	},

	{
		"RaafatTurki/hex.nvim",
		lazy = true,
		keys = {
			{ "<LEADER>hd", ":HexDump<CR>", desc = "HexDump" },
			{ "<LEADER>ha", ":HexAssemble<CR>", desc = "HexAssemble" },
			{ "<LEADER>ht", ":HexToggle<CR>", desc = "HexToggle" },
		},
	},

	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		lazy = true,
		opts = {
			-- prompt_func_return_type = {
			-- 	cpp = true,
			-- 	c = true,
			-- 	h = true,
			-- 	hpp = true,
			-- 	cxx = true,
			-- },
			-- prompt_func_param_type = {
			-- 	cpp = true,
			-- 	c = true,
			-- 	h = true,
			-- 	hpp = true,
			-- 	cxx = true,
			-- },
			-- printf_statements = {},
			-- print_var_statements = {},
			show_success_message = true,
		},
		ft = { "cpp", "c", "typescript", "javascript", "lua", "python" },
		keys = {
			{
				"<leader>rr",
				function()
					require("telescope").load_extension "refactoring"

					vim.keymap.set({ "n", "x" }, "<leader>rr", function()
						require("telescope").extensions.refactoring.refactors()
					end)
				end,
				mode = { "n", "x" },
			},
			{ "<leader>re", ":Refactor extract ", mode = "x", desc = "Refactor extract" },
			{ "<leader>rf", ":Refactor extract_to_file ", mode = "x", desc = "Refactor extract_to_file" },
			{ "<leader>rv", ":Refactor extract_var ", mode = "x", desc = "Refactor extract_var" },
			{ "<leader>ri", ":Refactor inline_var", mode = { "n", "x" }, desc = "Refactor inline_var" },
			{ "<leader>rI", ":Refactor inline_func", desc = "Refactor inline_func" },
			{ "<leader>rb", ":Refactor extract_block", desc = "Refactor extract_block" },
			{ "<leader>rbf", ":Refactor extract_block_to_file", desc = "Refactor extract_block_to_file" },

			{
				"<leader>rpv",
				function()
					require("refactoring").debug.print_var()
				end,
				mode = { "x", "n" },
				desc = "Refactor print var",
			},
			{
				"<leader>rpf",
				function()
					require("refactoring").debug.printf { below = false }
				end,
				desc = "Refactor printf",
			},
			{
				"<leader>rc",
				function()
					require("refactoring").debug.cleanup {}
				end,
				desc = "Refactor cleanup",
			},
		},
	},

	"chaoren/vim-wordmotion",
	"mg979/vim-visual-multi",

	"romainl/vim-cool",
	"tpope/vim-repeat",
	"tpope/vim-abolish",

	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
		opts = {},
	},

	{
		"mbbill/undotree",
		lazy = true,
		keys = {
			{ "<leader>ut", ":UndotreeToggle<CR>", { silent = true, noremap = true } },
		},
	},

	{
		"andymass/vim-matchup",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},

	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		config = function()
			vim.o.foldcolumn = "1" -- '0' is not bad
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true

			require("ufo").setup {
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
			}
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
		end,
	},

	{
		"danymat/neogen",
		opts = {},
		config = function()
			local opts = { noremap = true, silent = true }
			vim.api.nvim_set_keymap("n", "<Leader>ng", ":lua require('neogen').generate()<CR>", opts)
		end,
	},

	"wakatime/vim-wakatime",
}

return M
