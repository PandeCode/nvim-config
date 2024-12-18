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
	{
		"https://github.com/nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require "null-ls"
			local helpers = require "null-ls.helpers"

			null_ls.setup {
				sources = {
					-- null_ls.builtins.formatting.stylua,
					null_ls.builtins.completion.spell,
					-- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
				},
			}

			local markdownlint = {
				method = null_ls.methods.DIAGNOSTICS,
				filetypes = { "markdown" },
				-- null_ls.generator creates an async source
				-- that spawns the command with the given arguments and options
				generator = null_ls.generator {
					command = "markdownlint",
					args = { "--stdin" },
					to_stdin = true,
					from_stderr = true,
					-- choose an output format (raw, json, or line)
					format = "line",
					check_exit_code = function(code, stderr)
						local success = code <= 1

						if not success then
							-- can be noisy for things that run often (e.g. diagnostics), but can
							-- be useful for things that run on demand (e.g. formatting)
							print(stderr)
						end

						return success
					end,
					-- use helpers to parse the output from string matchers,
					-- or parse it manually with a function
					on_output = helpers.diagnostics.from_patterns {
						{
							pattern = [[:(%d+):(%d+) [%w-/]+ (.*)]],
							groups = { "row", "col", "message" },
						},
						{
							pattern = [[:(%d+) [%w-/]+ (.*)]],
							groups = { "row", "message" },
						},
					},
				},
			}

			local no_really = {
				method = null_ls.methods.DIAGNOSTICS,
				filetypes = { "markdown", "text" },
				generator = {
					fn = function(params)
						local diagnostics = {}
						-- sources have access to a params object
						-- containing info about the current file and editor state
						for i, line in ipairs(params.content) do
							local col, end_col = line:find "really"
							if col and end_col then
								-- null-ls fills in undefined positions
								-- and converts source diagnostics into the required format
								table.insert(diagnostics, {
									row = i,
									col = col,
									end_col = end_col + 1,
									source = "no-really",
									message = "Don't use 'really!'",
									severity = vim.diagnostic.severity.WARN,
								})
							end
						end
						return diagnostics
					end,
				},
			}

			null_ls.register(no_really)
			null_ls.register(markdownlint)

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = true })
		end,
		lazy = true,
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
}

return M
