local function copy_selection(prompt_bufnr)
	local value = require("telescope.actions.state").get_selected_entry().value
	require("telescope.actions").close(prompt_bufnr)
	vim.fn.setreg("+", value)
	vim.notify(value, nil, { title = "Copied", icon = "󰅍" })
end

return {

	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
		config = function()
			require("telescope").setup {
				defaults = {
					mappings = {
						i = { ["<C-c>"] = copy_selection },
					},
				},
				pickers = {
					find_files = {
						find_command = {
							"rg",
							"--no-config",
							"--follow",
							"--files",
							"--sortr=modified",
							("--ignore-file=" .. vim.fs.normalize "~/.config/ripgrep/ignore"),
						},
						prompt_title = "󰝰 Files in cwd",
						path_display = { "filename_first" },
						follow = true,
					},
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
				},
			}
			require("telescope").load_extension "fzf"

			local builtin = require "telescope.builtin"
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fr", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		end,
	},
}
