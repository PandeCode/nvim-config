local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--depth=1",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
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
}

local treesitter_ft = {
	"sh",
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
	"cpp",
	"c",
	"rust",
	"awk",
	"bash",
	"cmake",
	"css",
	"go",
	"gomod",
	"gotmpl",
	"gowork",
	"html",
	"javascript",
	"javascriptreact",
	"less",
	"lua",
	"postcss",
	"python",
	"sass",
	"scss",
	"sh",
	"typescript",
	"typescriptreact",
	"vim",
}

local luasnip_ft = {
	"c",
	"cmake",
	"cpp",
	"global",
	"glsl",
	"lua",
	"go",
	"lua",
	"python",
	"rust",
	"sh",
	"bash",
	"typescriptreact",
}

local doge_ft = {
	"sh",
	"bash",
	"c",
	"cpp",
	"csharp",
	"java",
	"javascript",
	"lua",
	"python",
	"rust",
	"typescript",
}

local refactoring_ft = {
	"c",
	"cpp",
	"rust",
	"golang",
	"java",
	"javascript",
	"lua",
	"python",
	"typescript",
}

local plugins = {
	{ "lewis6991/impatient.nvim", config = RequireFn("impatient") },

	{
		"marko-cerovac/material.nvim",
		config = RequireFn("plugins.material_conf"),
		priority = 100,
	},

	"stevearc/dressing.nvim",

	"airblade/vim-gitgutter",
	"ap/vim-css-color",
	"chaoren/vim-wordmotion",
	"itchyny/vim-cursorword",
	"mg979/vim-visual-multi",
	"rcarriga/nvim-notify",
	"romainl/vim-cool",
	"tpope/vim-repeat",
	{ "windwp/nvim-autopairs", config = RequireSetupFn("nvim-autopairs") },
	{ "kylechui/nvim-surround", config = RequireSetupFn("nvim-surround") },
	{ "chentoast/marks.nvim", config = RequireSetupFn("marks") },
	{ "folke/todo-comments.nvim", config = RequireSetupFn("todo-comments") },
	{ "Iron-E/nvim-libmodal", config = RequireFn("plugins.libmodal_conf") },
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
			{
				{
					"L3MON4D3/LuaSnip",
					config = RequireFn("plugins.luasnip_conf"),
					version = "<CurrentMajor>.*",
					build = "make install_jsregexp",
					ft = luasnip_ft,
					dependencies = { ft = luasnip_ft, "saadparwaiz1/cmp_luasnip" },
				},
			},
		},
	},

	{ "neovim/nvim-lspconfig", ft = lsp_ft, config = RequireFn("plugins.lsp") },
	{ "j-hui/fidget.nvim", config = RequireFn("plugins.fidget_conf"), priority = 49, ft = lsp_ft },
	{
		"simrat39/symbols-outline.nvim",
		config = RequireSetupFn("symbols-outline"),
		priority = 49,
		ft = lsp_ft,
		command = "SymbolsOutline",
		keys = { { "<LEADER>so", ":SymbolsOutline<cr>", desc = "SymbolsOutline" } },
	},

	{
		"kevinhwang91/nvim-ufo",
		config = RequireFn("plugins.ufo_conf"),
		dependencies = { "kevinhwang91/promise-async" },
		priority = 48,
	},

	{
		"folke/neodev.nvim",
		ft = { "lua" },
		config = RequireFn("plugins.neodev_conf"),
		priority = 47,
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
		dependencies = { "ray-x/guihua.lua" }
	},

	{
		"jose-elias-alvarez/typescript.nvim",
		ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
		config = RequireFn("plugins.typescript_conf"),
		priority = 0,
	},

	{
		"simrat39/rust-tools.nvim",
		ft = { "rust" },
		config = RequireFn("plugins.rust_tools_conf"),
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

	{ "kkoomen/vim-doge", build = ":call doge#install()", ft = doge_ft },

	{
		"ThePrimeagen/refactoring.nvim",
		config = RequireFn("plugins.refactoring_conf"),
		ft = refactoring_ft,
		priority = 0,
	},

	"wakatime/vim-wakatime",

	{
		"folke/which-key.nvim",
		commnad = "WhichKey",
		config = function()
			require("which-key").setup({})
		end,
	},

	{
		"Eandrju/cellular-automaton.nvim",
		keys = { "<leader>tf", "<cmd>CellularAutomaton make_it_rain<CR>" },
		command = "CellularAutomaton",
	},
}

require("lazy").setup(plugins, opt)
