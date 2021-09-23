local dap = require("dap")

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
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
		runInTerminal = false
	}
}

-- If you want to use this for rust and c, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
dap.configurations.python = {
	{
		-- The first three options are required by nvim-dap
		type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
		request = "launch",
		name = "Launch file",

		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

		program = "${file}", -- This configuration will launch the current file if used.
		pythonPath = function()
			-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
			-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
			-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
			local cwd = vim.fn.getcwd()
			if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
				return cwd .. "/venv/bin/python"
			elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
				return cwd .. "/.venv/bin/python"
			else
				return "/usr/bin/python"
			end
		end
	}
}

dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = {
		os.getenv("HOME") .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js"
	}
}
dap.configurations.javascript = {
	{
		type = "node2",
		request = "launch",
		program = "${workspaceFolder}/${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal"
	}
}

dap.adapters.chrome = {
	type = "executable",
	command = "node",
	args = {
		os.getenv("HOME") .. "/path/to/vscode-chrome-debug/out/src/chromeDebug.js"
	} -- TODO adjust
}

dap.configurations.javascriptreact = { -- change this to javascript if needed
	{
		type = "chrome",
		request = "attach",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9222,
		webRoot = "${workspaceFolder}"
	}
}

dap.configurations.typescriptreact = { -- change to typescript if needed
	{
		type = "chrome",
		request = "attach",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9222,
		webRoot = "${workspaceFolder}"
	}
}

dap.adapters.netcoredbg = {
	type = "executable",
	command = "/path/to/dotnet/netcoredbg/netcoredbg",
	args = {"--interpreter=vscode"}
}

dap.configurations.cs = {
	{
		type = "netcoredbg",
		name = "launch - netcoredbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
		end
	}
}
require("dapui").setup(
	{
		icons = {expanded = "▾", collapsed = "▸"},
		mappings = {
			-- Use a table to apply multiple mappings
			expand = {"<CR>", "<2-LeftMouse>"},
			open = "o",
			remove = "d",
			edit = "e",
			repl = "r"
		},
		sidebar = {
			open_on_start = true,
			-- You can change the order of elements in the sidebar
			elements = {
				-- Provide as ID strings or tables with "id" and "size" keys
				{
					id = "scopes",
					size = 0.25 -- Can be float or integer > 1
				},
				{id = "breakpoints", size = 0.25},
				{id = "stacks", size = 0.25},
				{id = "watches", size = 00.25}
			},
			size = 40,
			position = "left" -- Can be "left", "right", "top", "bottom"
		},
		tray = {
			open_on_start = true,
			elements = {"repl"},
			size = 10,
			position = "bottom" -- Can be "left", "right", "top", "bottom"
		},
		floating = {
			max_height = nil, -- These can be integers or a float between 0 and 1.
			max_width = nil, -- Floats will be treated as percentage of your screen.
			mappings = {close = {"q", "<Esc>"}}
		},
		windows = {indent = 1}
	}
)

-- virtual text deactivated (default)
vim.g.dap_virtual_text = false
-- show virtual text for current frame (recommended)
vim.g.dap_virtual_text = true
-- request variable values for all frames (experimental)
vim.g.dap_virtual_text = "all frames"

-- Exception virtual text can be deactivated via
-- require'nvim-dap-virtual-text'
-- require'dap'.listeners.after.exceptionInfo['nvim-dap-virtual-text'] = function() end
