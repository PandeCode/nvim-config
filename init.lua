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

local lsp_configs = { "lua_ls" }
--
-- for _, f in pairs(vim.api.nvim_get_runtime_file('nvim/lsp/*.lua', true)) do
--   local server_name = vim.fn.fnamemodify(f, ':t:r')
--   table.insert(lsp_configs, server_name)
-- end
--
vim.lsp.enable(lsp_configs)

require "config.lazy"
