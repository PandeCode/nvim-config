require("nvim-treesitter.configs").setup({
	disable = function(lang, buf)
		local max_filesize = 100 * 1024 -- 100 KB
		local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
		if ok and stats and stats.size > max_filesize then
			return true
		end
	end,

	additional_vim_regex_highlighting = true,

	highlight = { enable = true },
	indent = { enable = true },

	ensure_installed = {
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
})
