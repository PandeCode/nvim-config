return {
	{
		"timtro/glslView-nvim",
		ft = "glsl",
		opts = {
			viewer_path = "glslViewer",
			args = { "-l" },
		},
	},

	{
		"uga-rosa/ccc.nvim",
		keys = {
			{ "n", "<leader>co", ":CccConvert<CR>" },
		},
		opts = {},
	},
}
