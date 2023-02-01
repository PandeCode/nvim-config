require("orgmode").setup_ts_grammar()

require("nvim-treesitter.configs").setup({
	disable = function(_, buf)
		local max_filesize = 100 * 1024 -- 100 KB
		local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
		if ok and stats and stats.size > max_filesize then
			return true
		end
	end,

	indent = { enable = true },
	highlight = { enable = true, additional_vim_regex_highlighting = { "org" } },

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			scope_incremental = "<CR>",
			node_incremental = "<TAB>",
			node_decremental = "<S-TAB>",
		},
	},

	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = 300,
	},

	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			["aa"] = "@parameter.outer",
			["ia"] = "@parameter.inner",
			["af"] = "@function.outer",
			["if"] = "@function.inner",
			["ac"] = "@class.outer",
			["ic"] = "@class.inner",
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
	},

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
