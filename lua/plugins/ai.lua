return {

	{
		"giuxtaposition/blink-cmp-copilot",
		dependencies = { "zbirenbaum/copilot.lua" },
	},

	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "InsertEnter",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
			-- suggestion = {
			-- 	enabled = true,
			-- 	auto_trigger = true,
			-- 	keymap = {
			-- 		accept = false, -- handled by nvim-cmp / blink.cmp
			-- 		next = "<M-]>",
			-- 		prev = "<M-[>",
			-- 	},
			-- },
		},
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
