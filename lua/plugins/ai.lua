return {
	{
		"zbirenbaum/copilot.lua",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
		},
		keys = {
			{
				"<C-c>",
				function()
					require("copilot.panel").accept()
				end,
				mode = { "i", "s" },
				{ desc = "accept copliot" },
			},
		},
	},

	{
		"giuxtaposition/blink-cmp-copilot",
		dependencies = {
			"zbirenbaum/copilot.lua",
		},
	},

	{
		"yetone/avante.nvim",

		event = "VeryLazy",
		lazy = true,
		version = "*", -- set this if you want to always pull the latest change
		opts = {
			provider = "copilot",
			auto_suggestions_provider = "copilot",
			behaviour = {
				auto_suggestions = true, -- Experimental stage
				auto_set_highlight_group = true,
			},
			-- dual_boost = {
			--     enabled = true,
			--     first_provider = "copilot",
			--     second_provider = "gemini",
			--     prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
			--     timeout = 60000, -- Timeout in milliseconds
			-- },
		},
		build = "make",
		dependencies = {
			"zbirenbaum/copilot.lua",
			"MunifTanjim/nui.nvim",
			"MeanderingProgrammer/render-markdown.nvim",
		},
	},
}
