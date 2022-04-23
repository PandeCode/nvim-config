local Dapui = require("dapui")
local Dap = require("dap")

local dap_install = require("dap-install")

dap_install.config("chrome", {})
dap_install.config("jsnode", {})
dap_install.config("python", {})

dap_install.setup({
	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})

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

require("telescope").load_extension("dap")
-- stylua: ignore start
vim.api.nvim_set_keymap(Keys.N, "<space>tdc",      "<CMD>:Telescope dap commands<CR>",              Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N, "<space>tds",      "<CMD>:Telescope dap configurations<CR>",        Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N, "<space>tdl",      "<CMD>:Telescope dap list_breakpoints<CR>",      Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N, "<space>tdv",      "<CMD>:Telescope dap variables<CR>",             Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N, "<space>tdf",      "<CMD>:Telescope dap frames<CR>",                Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N, "<SPACE>d<SPACE>", "<CMD>lua require'dap'.continue()<CR>",          Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N, "<SPACE>db",       "<CMD>lua require'dap'.toggle_breakpoint()<CR>", Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N, "<SPACE>dr",       "<CMD>lua require'dap'.repl.open()<CR>",         Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N, "<SPACE>dj",       "<CMD>lua require'dap'.step_into()<CR>",         Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N, "<SPACE>dn",       "<CMD>lua require'dap'.step_over()<CR>",         Keys.Noremap)
-- stylua: ignore end

Dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-vscode", -- adjust as needed
	name = "lldb",
}

Dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = true,
		args = {},

		-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
		--
		--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
		--
		-- Otherwise you might get the following error:
		--
		--    Error on launch: Failed to attach to the target process
		--
		-- But you should be aware of the implications:
		-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
		runInTerminal = false,

		env = function()
			local variables = {}
			for k, v in pairs(vim.fn.environ()) do
				table.insert(variables, string.format("%s=%s", k, v))
			end
			return variables
		end,
	},
}

-- If you want to use this for rust and c, add something like this:

Dap.configurations.c = Dap.configurations.cpp
Dap.configurations.rust = Dap.configurations.cpp

--Dap.configurations.javascript[2] = Dap.configurations.javascriptreact
