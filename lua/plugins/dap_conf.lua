local dap = require("dap")

dap.adapters.godot = {
	type = "server",
	host = "127.0.0.1",
	port = 6006,
}

dap.configurations.gdscript = {
	{
		type = "godot",
		request = "launch",
		name = "Launch scene",
		project = "${workspaceFolder}",
		launch_scene = true,
	},
}

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = vim.fn.expand("~/apps/cpptools-linux-x64.vsix_extracted/extension/debugAdapters/bin/OpenDebugAD7"),
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.input("bin: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopAtEntry = true,
	},
	{
		name = "Attach to gdbserver :3849",
		type = "cppdbg",
		request = "launch",
		MIMode = "gdb",
		miDebuggerServerAddress = "localhost:3849",
		miDebuggerPath = "gdb",
		cwd = "${workspaceFolder}",
		program = function()
			return vim.fn.input("bin: ", vim.fn.getcwd() .. "/", "file")
		end,
	},
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
