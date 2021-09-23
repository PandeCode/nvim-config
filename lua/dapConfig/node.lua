Dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = {
		os.getenv("HOME") .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js",
	},
}
Dap.configurations.javascript = {
	{
		type = "node2",
		request = "launch",
		program = "${workspaceFolder}/${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
}
Dap.adapters.chrome = {
	type = "executable",
	command = "node",
	args = {
		os.getenv("HOME") .. "/path/to/vscode-chrome-debug/out/src/chromeDebug.js",
	}, -- TODO adjust
}
Dap.configurations.javascriptreact = { -- change this to javascript if needed
	{
		type = "chrome",
		request = "attach",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9222,
		webRoot = "${workspaceFolder}",
	},
}
Dap.configurations.typescriptreact = { -- change to typescript if needed
	{
		type = "chrome",
		request = "attach",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9222,
		webRoot = "${workspaceFolder}",
	},
}


