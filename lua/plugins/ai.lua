return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "InsertEnter",
		config = function()
			require("copilot").setup {
				panel = { enabled = false },
				suggestion = {
					enabled = true,
					auto_trigger = false, -- use next and prev keymaps to trigger
					hide_during_completion = true,
					debounce = 75,
					keymap = {
						accept = "<M-l>",
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
			}
			vim.api.nvim_create_autocmd("User", {
				pattern = "BlinkCmpCompletionMenuOpen",
				callback = function()
					require("copilot.suggestion").dismiss()
					vim.b.copilot_suggestion_hidden = true
				end,
			})

			vim.api.nvim_create_autocmd("User", {
				pattern = "BlinkCmpCompletionMenuClose",
				callback = function()
					vim.b.copilot_suggestion_hidden = false
				end,
			})
		end,
	},

	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		build = "make",
		lazy = true,
		version = "*",
		opts = {
			provider = "copilot",
		},
		dependencies = {
			"zbirenbaum/copilot.lua",
			"MunifTanjim/nui.nvim",
			"MeanderingProgrammer/render-markdown.nvim",
		},
	},
}
