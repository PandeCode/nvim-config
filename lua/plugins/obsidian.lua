return {
	{
		"HakonHarnes/img-clip.nvim",
		lazy = true,
		ft = { "markdown" },
		event = "VeryLazy",
		opts = {
			default = {
				embed_image_as_base64 = false,
				prompt_for_file_name = false,
				drag_and_drop = {
					insert_mode = true,
				},
				use_absolute_path = true,
			},
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		lazy = true,
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
		opts = {
			file_types = { "markdown" },
			preset = "obsidian",
		},
		ft = { "markdown" },
	},
	{
		"epwalsh/obsidian.nvim",
		lazy = true,
		ft = "markdown",
		event = {
			"BufReadPre Vault/**.md",
			"BufNewFile Vault/**.md",
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
					vim.keymap.set(
						"n",
						"<leader>p",
						':lua require("nabla").popup()<CR>',
						{ noremap = true, silent = true }
					)
				end,
			},
		},
		opts = {
			ui = { enable = false },

			workspaces = {
				{ name = "School", path = "/mnt/c/Users/pande/Vault/School" },
				{ name = "Jorunal", path = "/mnt/c/Users/pande/Vault/Jorunal" },
			},
		},
	},
}
