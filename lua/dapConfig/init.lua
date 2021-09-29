Dapui = require("dapui")
Dap = require("dap")

require("dapConfig.nlua")
require("dapConfig.cpp")
require("dapConfig.python")
require("dapConfig.node")
require("dapConfig.netcore")

local noremap = { noremap = true }
local n = "n"

require("telescope").load_extension("dap")

-- stylua: ignore start
vim.api.nvim_set_keymap(n, "<space>tdc",      "<CMD>:Telescope dap commands<CR>",              noremap)
vim.api.nvim_set_keymap(n, "<space>tds",      "<CMD>:Telescope dap configurations<CR>",        noremap)
vim.api.nvim_set_keymap(n, "<space>tdl",      "<CMD>:Telescope dap list_breakpoints<CR>",      noremap)
vim.api.nvim_set_keymap(n, "<space>tdv",      "<CMD>:Telescope dap variables<CR>",             noremap)
vim.api.nvim_set_keymap(n, "<space>tdf",      "<CMD>:Telescope dap frames<CR>",                noremap)
vim.api.nvim_set_keymap(n, "<SPACE>d<SPACE>", "<CMD>lua require'dap'.continue()<CR>",          noremap)
vim.api.nvim_set_keymap(n, "<SPACE>db",       "<CMD>lua require'dap'.toggle_breakpoint()<CR>", noremap)
vim.api.nvim_set_keymap(n, "<SPACE>dr",       "<CMD>lua require'dap'.repl.open()<CR>",         noremap)
vim.api.nvim_set_keymap(n, "<SPACE>dj",       "<CMD>lua require'dap'.step_into()<CR>",         noremap)
vim.api.nvim_set_keymap(n, "<SPACE>dn",       "<CMD>lua require'dap'.step_over()<CR>",         noremap)

-- stylua: ignore end

Dap.listeners.after.event_initialized["dapui_config"] = function()
	Dapui.open()
end
Dap.listeners.before.event_terminated["dapui_config"] = function()
	Dapui.close()
end
Dap.listeners.before.event_exited["dapui_config"] = function()
	Dapui.close()
end

Dapui.setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
	},
	sidebar = {
		open_on_start = false,
		-- You can change the order of elements in the sidebar
		elements = {
			-- Provide as ID strings or tables with "id" and "size" keys
			{
				id = "scopes",
				size = 0.25, -- Can be float or integer > 1
			},
			{ id = "breakpoints", size = 0.25 },
			{ id = "stacks", size = 0.25 },
			{ id = "watches", size = 00.25 },
		},
		size = 40,
		position = "left", -- Can be "left", "right", "top", "bottom"
	},
	tray = {
		open_on_start = false,
		elements = { "repl" },
		size = 10,
		position = "bottom", -- Can be "left", "right", "top", "bottom"
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		mappings = { close = { "q", "<Esc>" } },
	},
	windows = { indent = 1 },
})

-- virtual text deactivated (default)
vim.g.dap_virtual_text = true
-- show virtual text for current frame (recommended)
vim.g.dap_virtual_text = true
-- request variable values for all frames (experimental)
vim.g.dap_virtual_text = "all frames"

-- Exception virtual text can be deactivated via
-- require'nvim-dap-virtual-text'
-- require'dap'.listeners.after.exceptionInfo['nvim-dap-virtual-text'] = function() end
