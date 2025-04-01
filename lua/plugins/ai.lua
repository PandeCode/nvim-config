if vim.g.vscode ~= nil then
	return {}
end

local M = {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		-- event = "InsertEnter",
		lazy = true,
		config = function()
			require("copilot").setup {
				panel = { enabled = false },
                  copilot_model = "gpt-4o-copilot",  -- gpt-35-turbo
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
		build = "make",
		version = "*",
		cmd = "AvanteAsk",
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

if vim.env.NO_AI then
	vim.print "No  AI"
	return {}
else
	return M
end
