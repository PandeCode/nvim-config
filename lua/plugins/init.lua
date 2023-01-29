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

local plugins = {
	{ "lewis6991/impatient.nvim", config = RequireFn("impatient") },

	{ "marko-cerovac/material.nvim", config = RequireFn("plugins.material_conf"), priority = 100 },

	{ "Iron-E/nvim-libmodal", config = RequireFn("plugins.libmodal_conf"), prority = 48 },
	{ "ap/vim-css-color", priority = 48 },
	{ "chentoast/marks.nvim", config = RequireSetupFn("marks"), priority = 48 },
	{ "chaoren/vim-wordmotion", priority = 48 },
	{ "itchyny/vim-cursorword", priority = 48 },
	{ "junegunn/vim-easy-align", config = RequireFn("plugins.easyalign_conf"), priority = 48 },
	{ "mbbill/undotree", config = RequireFn("plugins.undotree_conf"), priority = 48 },
	{ "mg979/vim-visual-multi", priority = 48 },
	{ "preservim/nerdcommenter", config = RequireFn("plugins.nerdcommenter_conf"), priority = 48 },
	{ "romainl/vim-cool", priority = 48 },
	{ "sbdchd/neoformat", config = RequireFn("plugins.neoformat_conf"), priority = 48 },
	{ "tpope/vim-repeat", priority = 48 },
	{ "tpope/vim-surround", priority = 48 },
	{ "rcarriga/nvim-notify", prority = 48 },
	{ "folke/todo-comments.nvim", config = RequireSetupFn("todo-comments"), prority = 48 },

	{
		"ludovicchabant/vim-gutentags",
		config = function()
			vim.g.gutentags_cache_dir = vim.fn.expand("~") .. "/.cache/ctags"
		end,
		prority = 48,
	},

	{ "rcarriga/nvim-notify", prority = 48 },
	{ "airblade/vim-gitgutter", prority = 48 },
	{
		"andymass/vim-matchup",
		prority = 48,
		setup = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},

	{ "nvim-tree/nvim-web-devicons", priority = 48 },
	{ "akinsho/bufferline.nvim", config = RequireFn("plugins.bufferline_conf"), priority = 47 },
	{ "nvim-lualine/lualine.nvim", config = RequireFn("plugins.lualine_conf"), priority = 47 },

	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = RequireFn("plugins.dashboard_conf"),
		priority = 46,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		priority = 45,
		config = RequireFn("plugins.treesitter_conf"),
		ft = {
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
		},
	},

	{
		"L3MON4D3/LuaSnip",
		config = RequireFn("plugins.luasnip_conf"),
		build = "make install_jsregexp",
		priority = 44,
		ft = { "c", "cmake", "cpp", "global", "glsl", "go", "lua", "python", "rust", "sh", "typescriptreact" },
	},

	{ "hrsh7th/cmp-nvim-lsp", prority = 43 },
	{ "quangnguyen30192/cmp-nvim-tags", prority = 43 },
	{ "hrsh7th/cmp-buffer", prority = 43 },
	{ "hrsh7th/cmp-path", prority = 43 },
	{ "hrsh7th/cmp-cmdline", prority = 43 },
	{
		"saadparwaiz1/cmp_luasnip",
		priority = 43,
		ft = { "c", "cmake", "cpp", "global", "glsl", "go", "lua", "python", "rust", "sh", "typescriptreact" },
	},

	{
		"hrsh7th/nvim-cmp",
		config = RequireFn("plugins.cmp_conf"),
		priority = 42,
	},

	{
		"folke/neodev.nvim",
		ft = { "lua" },
		priority = 41,
		config = RequireFn("plugins.neodev_conf"),
	},

	{
		"neovim/nvim-lspconfig",
		config = RequireFn("plugins.lsp"),
		ft = {
			"lua",
			"rust",
			"c",
			"cpp",
			"bash",
			"json",
			"jsonc",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"glsl",
			"vimscript",
			"go",
		},
		prority = 40,
	},

	{
		"j-hui/fidget.nvim",
		config = RequireFn("plugins.fidget_conf"),
		prority = 39,
	},

	{ "nvim-lua/plenary.nvim", prority = 38 },

	{
		"nvim-telescope/telescope.nvim",
		prority = 37,
		config = RequireFn("plugins.telescope_conf"),
	},

	{
		"nvim-treesitter/playground",
		cmd = "TSPlayground",
		lazy = true,
	},

	{
		"p00f/clangd_extensions.nvim",
		config = RequireFn("plugins.clangd_extensions_conf"),
		ft = { "cpp", "c" },
		lazy = true,
		prority = 0,
	},

	{
		"simrat39/rust-tools.nvim",
		config = RequireFn("plugins.rust_tools_conf"),
		ft = { "rust" },
		lazy = true,
		prority = 0,
	},

}

require("lazy").setup(plugins, opt)
