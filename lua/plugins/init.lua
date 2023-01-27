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

	{ "marko-cerovac/material.nvim", config = RequireFn("plugins.material_conf"), priority = 49 },

	{ "mg979/vim-visual-multi", priority = 48 },
	{ "tpope/vim-surround", priority = 48 },
	{ "junegunn/vim-easy-align", config = RequireFn("plugins.easyalign_conf"), priority = 48 },
	{ "preservim/nerdcommenter", config = RequireFn("plugins.nerdcommenter_conf"), priority = 48 },
	{ "sbdchd/neoformat", config = RequireFn("plugins.neoformat_conf"), priority = 48 },

	{ "nvim-tree/nvim-web-devicons", priority = 48 },
	{ "akinsho/bufferline.nvim", config = RequireFn("plugins.bufferline_conf"), priority = 47 },
	{ "nvim-lualine/lualine.nvim", config = RequireFn("plugins.lualine_conf"), priority = 47 },

	{ "williamboman/mason.nvim", config = RequireFn("plugins.mason_conf"), prority = 47 },

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		priority = 46,
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
		priority = 45,
		ft = { "c", "cmake", "cpp", "global", "glsl", "go", "lua", "python", "rust", "sh", "typescriptreact" },
	},

	{ "hrsh7th/cmp-nvim-lsp", prority = 44 },
	{ "hrsh7th/cmp-buffer", prority = 44 },
	{ "hrsh7th/cmp-path", prority = 44 },
	{ "hrsh7th/cmp-cmdline", prority = 44 },
	{
		"saadparwaiz1/cmp_luasnip",
		priority = 44,
		ft = { "c", "cmake", "cpp", "global", "glsl", "go", "lua", "python", "rust", "sh", "typescriptreact" },
	},

	{
		"hrsh7th/nvim-cmp",
		config = RequireFn("plugins.cmp_conf"),
		priority = 43,
	},

	{ "williamboman/mason-lspconfig.nvim", config = RequireFn("plugins.mason_lspconfig_conf"), prority = 43 },

	{
		"folke/neodev.nvim",
		ft = { "lua" },
		priority = 42,
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
		prority = 41,
	},
}

require("lazy").setup(plugins, opt)
