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

local treesitter_ft = {
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
}
local vsnip_ft = {
	"c",
	"cmake",
	"cpp",
	"global",
	"glsl",
	"go",
	"lua",
	"python",
	"rust",
	"sh",
	"typescriptreact",
}

local doge_ft = {
	"python",
	"javaScript",
	"typeScript",
	"lua",
	"java",
	"cpp",
	"c",
	"csharp",
	"bash",
	"rust",
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
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = RequireFn("plugins.treesitter_conf"),
		ft = treesitter_ft,
	},

	{
		"nvim-treesitter/playground",
		cmd = "TSPlayground",
		lazy = true,
		priority = 49,
	},

	{
		"hrsh7th/nvim-cmp",
		config = RequireFn("plugins.cmp_conf"),
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "quangnguyen30192/cmp-nvim-tags" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{
				{
					"hrsh7th/vim-vsnip",
					config = function()
						vim.g.vsnip_snippet_dir = vim.fn.expand("~/.config/nvim/snippets/")
					end,
					ft = vsnip_ft,
					dependencies = { ft = vsnip_ft, "hrsh7th/cmp-vsnip" },
				},
			},
		},
	},

	{ "neovim/nvim-lspconfig", ft = lsp_ft, config = RequireFn("plugins.lsp") },
	{ "j-hui/fidget.nvim", config = RequireFn("plugins.fidget_conf"), priority = 49 },

	{
		"folke/neodev.nvim",
		ft = { "lua" },
		config = RequireFn("plugins.neodev_conf"),
		priority = 48,
	},
	{
		"p00f/clangd_extensions.nvim",
		ft = { "cpp", "c" },
		config = RequireFn("plugins.clangd_extensions_conf"),
		priority = 48,
	},
	{
		"simrat39/rust-tools.nvim",
		ft = { "rust" },
		config = RequireFn("plugins.rust_tools_conf"),
		priority = 48,
	},

	{ "mfussenegger/nvim-dap", config = RequireFn("plugins.dap_conf") },

	{
		"rcarriga/nvim-dap-ui",
		config = RequireFn("plugins.dap_ui_conf"),
		priority = 49,
	},

	{ "kkoomen/vim-doge", build = ":call doge#install()", ft = doge_ft },
}

require("lazy").setup(plugins, opt)
