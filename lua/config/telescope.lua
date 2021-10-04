local noremapSilent = { noremap = true, silent = true }
local n = "n"

-- stylua: ignore start

vim.api.nvim_set_keymap(n, "<space>tf",   "<CMD>Telescope find_files<CR>",                  noremapSilent)
vim.api.nvim_set_keymap(n, "<space>tl",   "<CMD>Telescope live_grep<CR>",                   noremapSilent)
vim.api.nvim_set_keymap(n, "<space>tb",   "<CMD>Telescope buffers<CR>",                     noremapSilent)
vim.api.nvim_set_keymap(n, "<space>th",   "<CMD>Telescope help_tags<CR>",                   noremapSilent)
vim.api.nvim_set_keymap(n, "<space>tc",   "<CMD>Telescope colorsheme<CR>",                  noremapSilent)
vim.api.nvim_set_keymap(n, "<space>tmf",  "<CMD>Telescope media_files<CR>",                 noremapSilent)
vim.api.nvim_set_keymap(n, "<space>tgi",  "<CMD>Telescope gh issues<CR>",                   noremapSilent)
vim.api.nvim_set_keymap(n, "<space>tgpr", "<CMD>Telescope gh pull_request<CR>",             noremapSilent)
vim.api.nvim_set_keymap(n, "<space>tgg",  "<CMD>Telescope gh gist<CR>",                     noremapSilent)
vim.api.nvim_set_keymap(n, "<space>tgr",  "<CMD>Telescope gh run<CR>",                      noremapSilent)
vim.api.nvim_set_keymap(n, "<space>tss",  "<CMD>Telescope session-lens search_session<CR>", noremapSilent)
-- stylua: ignore end

require("telescope").setup({
	extensions = {
		media_files = {
			-- filetypes whitelist
			-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
			filetypes = { "png", "webp", "webm", "pdf", "mp4", "jpg", "jpeg", "mp3" },
			find_cmd = "rg", -- find command (defaults to `fd`)
		},
	},
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		prompt_prefix = "> ",
		selection_caret = "> ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				mirror = false,
			},
			vertical = {
				mirror = false,
			},
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = {},
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		path_display = true,
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
	},
})

require("telescope").load_extension("gh")
require("telescope").load_extension("media_files")
