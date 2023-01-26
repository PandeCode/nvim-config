local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system(
		{
			"git",
			"clone",
			"--filter=blob:none",
			"--depth=1",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazypath
		}
	)
end
vim.opt.rtp:prepend(lazypath)

function uninstall_lazy()
	vim.fn.system(
		{
			"rm",
			"-fr",
			"~/.local/share/nvim/lazy",
			"~/.local/state/nvim/lazy",
			"~/.config/nvim/lazy-lock.json"
		}
	)
end

local opt = {}

local plugins = {
	{"lewis6991/impatient.nvim", config = RequireFn("impatient")},

	{"williamboman/mason.nvim", config = RequireFn("plugins.mason_conf")},

	{"marko-cerovac/material.nvim", config = RequireFn("plugins.material_conf")},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
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
			"yaml"
		}
	},

	"mg979/vim-visual-multi",
	"tpope/vim-surround",
	{"preservim/nerdcommenter", config = RequireFn("plugins.nerdcommenter_conf")},

	"nvim-tree/nvim-web-devicons",
	{"akinsho/bufferline.nvim", config = RequireFn("plugins.bufferline_conf")},
	{"nvim-lualine/lualine.nvim", config = RequireFn("plugins.lualine_conf")},

	{"neovim/nvim-lspconfig", config = RequireFn("plugins.lspconfig_conf")},

	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",

	{
		"L3MON4D3/LuaSnip",
		config = RequireFn("plugins.luasnip_conf"),
		build = "make install_jsregexp"
	},
	"saadparwaiz1/cmp_luasnip",

	{"hrsh7th/nvim-cmp", config = RequireFn("plugins.nvim_cmp_conf")},

	{ "junegunn/vim-easy-align", config = RequireFn("plugins.easyalign_conf") },

	{  "sbdchd/neoformat", config = RequireFn("plugins.neoformat_conf") }

}

require("lazy").setup(plugins, opt)
