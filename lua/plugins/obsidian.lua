return {
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		ft = { "plaintex" },
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"
		end,
	},
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
			"BufReadPre Vaults/**.md",
			"BufNewFile Vaults/**.md",
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
				{ name = "School", path = vim.fs.normalize "~/Vaults/School" },
			},
		},
	},
}
