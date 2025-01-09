local M = {
	{
		"stevearc/oil.nvim",
		lazy = false,
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		keys = { { "<leader>-", "<CMD>Oil<CR>", { desc = "Open parent directory" } } },
		dependencies = { "nvim-tree/nvim-web-devicons" },
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
		-- ft = {
		-- 	"lua",
		-- 	"typescriptreact",
		-- 	"typescript",
		-- 	"sh",
		-- 	"c",
		-- 	"cs",
		-- 	"cpp",
		-- 	"go",
		-- 	"javascript",
		-- 	"javascriptreact",
		-- 	"lua",
		-- 	"python",
		-- 	"rust",
		-- },
		keys = { { "<Leader>ng", ':lua require("neogen").generate({snippet_engine = "luasnip"})<CR>' } },
	},

	{
		"LhKipp/nvim-nu",
		build = ":TSInstall nu",
		ft = "nu",
		opts = {
			use_lsp_features = true, -- requires https://github.com/jose-elias-alvarez/null-ls.nvim
			-- lsp_feature: all_cmd_names is the source for the cmd name completion.
			-- It can be
			--  * a string, which is evaluated by nushell and the returned list is the source for completions (requires plenary.nvim)
			--  * a list, which is the direct source for completions (e.G. all_cmd_names = {"echo", "to csv", ...})
			--  * a function, returning a list of strings and the return value is used as the source for completions
			all_cmd_names = [[help commands | get name | str join "\n"]],
		},
	},
	{ -- This plugin
		"Zeioth/compiler.nvim",
		cmd = { "CompilerOpen", "CompilerToggleResults" },
		dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
		keys = {
			{ "<LEADER>co", ":CompilerOpen<CR>", desc = "CompilerOpen" },
			{ "<LEADER>ct", ":CompilerToggleResults<CR>", desc = "CompilerToggleResults" },
			{ "<LEADER>cr", ":CompilerRedo<CR>", desc = "CompilerRedo" },
			{ "<LEADER>cs", ":CompilerStop<CR>", desc = "CompilerStop" },
		},
		opts = {},
	},
	{ -- The task runner we use
		"stevearc/overseer.nvim",
		commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
		cmd = { "CompilerOpen" },
		opts = {
			task_list = {
				direction = "right",
				min_height = 15,
				max_height = 15,
				default_detail = 1,
			},
		},
	},
	{
		"stevearc/conform.nvim",
		cmd = { "ConformInfo" },
		keys = { { "<leader>ci", ":ConformInfo<CR>" } },
		-- This will provide type hinting with LuaLS
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			formatters_by_ft = {
				-- stylua: ignore start
				nix    = { "alejandra"    },
				lua    = { "stylua"       },
				python = { "black"        },
				rust   = { "rustfmt"      },
				cpp    = { "clang-format" },
				c      = { "clang-format" },

				javascript      = { "prettierd" },
				typescript      = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				json            = { "prettierd" },
				markdown        = { "prettierd" },
				-- stylua: ignore end
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			format_on_save = function(bufnr)
				-- Disable autoformat on certain filetypes
				local ignore_filetypes = { "sql", "java" }
				if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
					return
				end
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				-- Disable autoformat for files in a certain path
				local bufname = vim.api.nvim_buf_get_name(bufnr)
				if bufname:match "/node_modules/" then
					return
				end
				-- ...additional logic...
				return { timeout_ms = 500, lsp_format = "fallback" }
			end,
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
				stylua = {
					prepend_args = { "-g", "!xmake.lua" },
				},
			},
		},
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

			vim.keymap.set("", "<leader>cf", function()
				require("conform").format({ async = false, timeout_ms = 500, lsp_fallabck = true }, function(err)
					if not err then
						local mode = vim.api.nvim_get_mode().mode
						if vim.startswith(string.lower(mode), "v") then
							vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
						end
					end
				end)
			end, { desc = "Format code" })
		end,
	},
}

return M
