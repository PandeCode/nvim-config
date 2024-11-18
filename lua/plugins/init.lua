local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--depth=1",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

function UNINSTALL_LAZY()
	vim.fn.system({
		"rm",
		"-fr",
		"~/.local/share/nvim/lazy",
		"~/.local/state/nvim/lazy",
		"~/.config/nvim/lazy-lock.json",
	})
end

local opt = {}

local dap_ft = {
	"python",
	"c",
	"cpp",
	"rust",
	"gd",
	"gdscript",
	"gdscript3",
}

local treesitter_ft = {
	"sh",
	"kdl",
	"bash",
	"c",
	"c_sharp",
	"cmake",
	"comment",
	"cpp",
	"css",
	"dart",
	"dockerfile",
	"fish",
	"gdscript",
	"go",
	"gomod",
	"graphql",
	"haskell",
	"help",
	"html",
	"java",
	"javascript",
	"jsdoc",
	"json5",
	"kotlin",
	"lua",
	"org",
	"python",
	"query",
	"regex",
	"rst",
	"ruby",
	"rust",
	"scss",
	"surface",
	"svelte",
	"teal",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vue",
	"yaml",
}

local lsp_ft = {
	"awk",
	"bash",
	"c",
	"cmake",
	"cpp",
	"css",
	"dart",
	"go",
	"gomod",
	"gotmpl",
	"gowork",
	"gd",
	"gdscript",
	"gdscript3",
	"haskell",
	"html",
	"javascript",
	"javascriptreact",
	"less",
	"lhaskell",
	"lua",
	"nix",
	"postcss",
	"python",
	"rust",
	"sass",
	"scss",
	"sh",
	"typescript",
	"typescriptreact",
	"vim",
	"vlang",
	"yaml",
}

local luasnip_ft = {
	"bash",
	"c",
	"cmake",
	"cpp",
	"dart",
	"global",
	"glsl",
	"go",
	"lua",
	"lua",
	"python",
	"rust",
	"sh",
	"typescriptreact",
}

local neogen_ft = {
	"bash",
	"c",
	"cpp",
	"csharp",
	"java",
	"javascript",
	"lua",
	"python",
	"rust",
	"sh",
	"typescript",
}

local refactoring_ft = {
	"c",
	"cpp",
	"golang",
	"java",
	"javascript",
	"lua",
	"python",
	"rust",
	"typescript",
}

local vscode_enabled_plugins = {
	{
		"RaafatTurki/hex.nvim",
		config = RequireSetupFn("hex"),
		priority = 0,
		keys = {
			{ "<LEADER>hd", ":HexDump<CR>", desc = "HexDump" },
			{ "<LEADER>ha", ":HexAssemble<CR>", desc = "HexAssemble" },
			{ "<LEADER>ht", ":HexToggle<CR>", desc = "HexToggle" },
		},
	},

	{ "lewis6991/impatient.nvim", config = RequireFn("impatient") },

	"chaoren/vim-wordmotion",
	"itchyny/vim-cursorword",
	"mg979/vim-visual-multi",

	"romainl/vim-cool",
	"tpope/vim-repeat",
	"tpope/vim-sleuth",
	"tpope/vim-abolish",
	{ "windwp/nvim-autopairs", config = RequireSetupFn("nvim-autopairs") },
	{ "kylechui/nvim-surround", config = RequireSetupFn("nvim-surround") },
	{ "chentoast/marks.nvim", config = RequireSetupFn("marks") },
	{ "junegunn/vim-easy-align", config = RequireFn("plugins.easyalign_conf") },
	{ "mbbill/undotree", config = RequireFn("plugins.undotree_conf") },
	{ "preservim/nerdcommenter", config = RequireFn("plugins.nerdcommenter_conf") },
	{ "sbdchd/neoformat", config = RequireFn("plugins.neoformat_conf") },

	{
		"ludovicchabant/vim-gutentags",
		config = function()
			vim.g.gutentags_cache_dir = vim.fn.expand("~/.cache/ctags")
		end,
	},
	{
		"andymass/vim-matchup",
		setup = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},

	{
		"kevinhwang91/nvim-ufo",
		config = RequireFn("plugins.ufo_conf"),
		dependencies = { "kevinhwang91/promise-async" },
		priority = 48,
	},

	{ "danymat/neogen", config = RequireFn("plugins.neogen_conf"), ft = neogen_ft },

	"wakatime/vim-wakatime",
}

local vscode_disabled_plugins = {
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = RequireFn("plugins.mini_conf"),
	},

	{
		"cshuaimin/ssr.nvim",
		module = "ssr",
		-- Calling setup is optional.
		config = function()
			require("ssr").setup({
				border = "rounded",
				min_width = 50,
				min_height = 5,
				max_width = 120,
				max_height = 25,
				adjust_window = true,
				keymaps = {
					close = "q",
					next_match = "n",
					prev_match = "N",
					replace_confirm = "<cr>",
					replace_all = "<leader><cr>",
				},
			})

			vim.keymap.set({ "n", "x" }, "<leader>sr", function()
				require("ssr").open()
			end)
		end,
	},

	{
		"folke/zen-mode.nvim",
		keys = { { "<LEADER>zm", ":ZenMode<cr>", desc = "ZenMode" } },
		priority = 0,
	},

	{
		"folke/twilight.nvim",
		keys = { { "<LEADER>tl", ":Twilight<cr>", desc = "Twilight" } },
		priority = 0,
	},

	{
		"ThePrimeagen/refactoring.nvim",
		config = RequireFn("plugins.refactoring_conf"),
		ft = refactoring_ft,
		priority = 0,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},

	{
		"folke/tokyonight.nvim",
		config = RequireFn("plugins.theme_conf"),
		priority = 100,
	},

	"stevearc/dressing.nvim",

	"airblade/vim-gitgutter",
	"ap/vim-css-color",

	{ "folke/todo-comments.nvim", config = RequireSetupFn("todo-comments") },
	{ "Iron-E/nvim-libmodal", config = RequireFn("plugins.libmodal_conf") },
	{ "nvim-tree/nvim-web-devicons" },
	{
		"akinsho/bufferline.nvim",
		config = RequireFn("plugins.bufferline_conf"),
		priority = 49,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = RequireFn("plugins.lualine_conf"),
		priority = 49,
	},

	{
		"glepnir/dashboard-nvim",
		config = RequireFn("plugins.dashboard_conf"),
		event = "VimEnter",
	},

	{
		"nvim-telescope/telescope.nvim",
		config = RequireFn("plugins.telescope_conf"),
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"nvim-orgmode/orgmode",
		config = RequireFn("orgmode"),
		ft = { "org" },
	},

	{ "mrjones2014/nvim-ts-rainbow", ft = treesitter_ft },

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		ft = treesitter_ft,
	},

	{ "lukas-reineke/indent-blankline.nvim", config = RequireFn("plugins.indent_blankline_conf"), priority = 49 },

	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		event = {
			"BufReadPre /mnt/c/Users/pande/Vault/**.md",
			"BufNewFile /mnt/c/Users/pande/Vault/**.md",
			"BufReadPre /mnt/c/Users/pande/Vault/**.md",
			"BufNewFile /mnt/c/Users/pande/Vault/**.md",
		},
		keys = {
			{
				"<leader>ob",
				function()
					vim.ui.select({
						"QuickSwitch",
						"Search",
						"New",
						"Link",
						"Open",
						"Check",
						"Today",
						"Rename",
						"LinkNew",
						"PasteImg",
						"Template",
						"Tomorrow",
						"Backlinks",
						"Workspace",
						"Yesterday",
						"FollowLink",
					}, {
						prompt = "Obsidian:",
						format_item = function(item)
							return "Obsidian" .. item
						end,
					}, function(choice)
						if choice ~= nil then
							vim.schedule(function()
								vim.cmd("Obsidian" .. choice)
							end)
						end
					end)
				end,
			},
			desc = "Obsidian",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"jbyuki/nabla.nvim",
				config = function()
					vim.keymap.set(Keys.N, "<leader>p", ':lua require("nabla").popup()<CR>', Keys.Noremap)
					-- require("nabla").enable_virt({
					-- autogen = true, -- auto-regenerate ASCII art when exiting insert mode
					-- silent = true, -- silents error messages
					-- })
				end,
			},
		},
		opts = {
			workspaces = {
				{ name = "School", path = "/mnt/c/Users/pande/Vault/School" },
				{ name = "Jorunal", path = "/mnt/c/Users/pande/Vault/Jorunal" },
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		priority = 49,
		config = RequireFn("plugins.treesitter_conf"),
		ft = treesitter_ft,
	},

	{
		"nvim-treesitter/playground",
		cmd = "TSPlayground",
		priority = 49,
	},

	{
		"hrsh7th/nvim-cmp",
		config = RequireFn("plugins.cmp_conf"),
		priority = 48,
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp", ft = lsp_ft },
			{ "quangnguyen30192/cmp-nvim-tags" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "onsails/lspkind.nvim" },
			-- {
			--     "supermaven-inc/supermaven-nvim",
			--     config = function()
			--         require("supermaven-nvim").setup({})
			--
			--         vim.api.nvim_set_hl(0, "CmpItemKindSupermaven", { fg = "#6CC644" })
			--     end,
			-- },
			{
				{
					"L3MON4D3/LuaSnip",
					config = RequireFn("plugins.luasnip_conf"),
					version = "1.*",
					build = "make install_jsregexp",
					ft = luasnip_ft,
					dependencies = { ft = luasnip_ft, "saadparwaiz1/cmp_luasnip" },
				},
			},
		},
	},

	{
		"zbirenbaum/copilot.lua",
		-- config = RequireSetupFn("copilot"),
		opts = {},
		dependencies = {
			{
				"zbirenbaum/copilot-cmp",
				opts = { suggestion = { enabled = false }, panel = { enabled = false } },
			},
		},
	},

	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- set this if you want to always pull the latest change
		opts = {
			provider = "copilot",
			auto_suggestions_provider = "copilot",
			behaviour = {
				auto_suggestions = false, -- Experimental stage
				auto_set_highlight_group = false,
			},
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		dependencies = {
			"MunifTanjim/nui.nvim",

			--- The below dependencies are optional,
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},

	{ "neovim/nvim-lspconfig", ft = lsp_ft, config = RequireFn("plugins.lsp"), priority = 50 },

	{
		"j-hui/fidget.nvim",
		branch = "legacy",
		config = RequireFn("plugins.fidget_conf"),
		priority = 49,
		ft = lsp_ft,
	},
	{
		"simrat39/symbols-outline.nvim",
		config = RequireSetupFn("symbols-outline"),
		priority = 49,
		ft = lsp_ft,
		command = "SymbolsOutline",
		keys = { { "<LEADER>so", ":SymbolsOutline<cr>", desc = "SymbolsOutline" } },
	},

	{
		"folke/neodev.nvim",
		ft = { "lua" },
		config = RequireFn("plugins.neodev_conf"),
		priority = 47,
		lazy = true,
		event = {
			"BufReadPre ~/.config/nvim/**.lua",
			"BufNewFile ~/.config/nvim/**.lua",
			"BufReadPre ~/.config/nvim/**.lua",
			"BufNewFile ~/.config/nvim/**.lua",
		},
	},
	{
		"p00f/clangd_extensions.nvim",
		ft = { "cpp", "c" },
		config = RequireFn("plugins.clangd_extensions_conf"),
		lazy = true,
		priority = 0,
	},

	{
		"ray-x/go.nvim",
		priority = 0,
		config = RequireFn("plugins.go_conf"),
		ft = { "go", "gomod", "gowork", "gotmpl" },
		dependencies = { "ray-x/guihua.lua" },
	},

	{
		"jose-elias-alvarez/typescript.nvim",
		ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
		config = RequireFn("plugins.typescript_conf"),
		priority = 1,
	},

	{
		"dmmulroy/ts-error-translator.nvim",
		ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
		config = RequireSetupFn("ts-error-translator"),
		priority = 0,
	},

	{
		"simrat39/rust-tools.nvim",
		ft = { "rust" },
		config = RequireFn("plugins.rust_tools_conf"),
		priority = 0,
		dependencies = { "neovim/nvim-lspconfig", ft = lsp_ft, config = RequireFn("plugins.lsp"), priority = 50 },
	},

	{
		"akinsho/flutter-tools.nvim",
		ft = { "dart" },
		config = RequireFn("plugins.flutter_tools_conf"),
		lazy = true,
		priority = 0,
	},

	{
		"b0o/SchemaStore.nvim",
		ft = { "json", "json5", "jsonc" },
		config = RequireFn("plugins.schemastore_conf"),
		priority = 0,
	},

	{ "mfussenegger/nvim-dap", config = RequireFn("plugins.dap_conf"), ft = dap_ft },

	{
		"rcarriga/nvim-dap-ui",
		config = RequireFn("plugins.dap_ui_conf"),
		ft = dap_ft,
		priority = 49,
	},

	{
		"folke/which-key.nvim",
		commnad = "WhichKey",
		config = RequireSetupFn("which-key"),
	},

	{
		"Eandrju/cellular-automaton.nvim",
		keys = { "<leader>tf", "<cmd>CellularAutomaton make_it_rain<CR>" },
		command = "CellularAutomaton",
	},

	{
		"Maan2003/lsp_lines.nvim",
		priority = 0,
		ft = lsp_ft,
		config = function()
			require("lsp_lines").setup()
			vim.diagnostic.config({ virtual_lines = { only_current_line = true }, virtual_text = false })
		end,
	},
	{
		"ollykel/v-vim",
		priority = 0,
		ft = { "vlang" },
	},

	{
		"mrcjkb/haskell-tools.nvim",
		version = "^4", -- Recommended
		priority = 0,
		ft = { "haskell", "cabal" },
		lazy = false, -- This plugin is already lazy
	},

	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
	},
}

local plugins = vscode_enabled_plugins
if not vim.g.vscode then
	plugins = TableConcat(plugins, vscode_disabled_plugins)
end

require("lazy").setup(plugins, opt)
