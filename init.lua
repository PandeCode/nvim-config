vim.loader.enable()

if vim.env.PROF then
	local snacks = vim.fn.stdpath "data" .. "/lazy/snacks.nvim"
	vim.opt.rtp:append(snacks)
	require("snacks.profiler").startup {
		startup = {
			event = "VimEnter", -- stop profiler on this event. Defaults to `VimEnter`
			-- event = "UIEnter",
			-- event = "VeryLazy",
		},
	}
end

require "utils"

require "config.keymaps"
require "config.autocmds"

require "config.options"

require "config.neovide"
require "config.vscode"

require "config.lazy"
