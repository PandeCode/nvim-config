return {
	-- using lazy.nvim
	{
		"S1M0N38/love2d.nvim",
		cmd = "LoveRun",
		opts = {},
		keys = {
			{ "<leader>ll", ft = "lua", desc = "LÖVE" },
			{ "<leader>lr", "<cmd>LoveRun<cr>", ft = "lua", desc = "Run LÖVE" },
			{ "<leader>ls", "<cmd>LoveStop<cr>", ft = "lua", desc = "Stop LÖVE" },
		},
		event = {
			"BufReadPre lua/love/**.lua",
			"BufNewFile lua/love/**.lua",
		},
	},
}
