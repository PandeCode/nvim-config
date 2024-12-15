return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.cursorword").setup()
			require("mini.pairs").setup()
			-- require("mini.animate").setup()
			require("mini.align").setup()

			-- TODO: Remove This
			require("mini.basics").setup {
				options = {
					extra_ui = true,
					win_borders = "single",
				},

				mappings = {
					option_toggle_prefix = [[]],
				},

				autocommands = {
					relnum_in_visual_mode = true,
				},
			}


		end,
	},
}
