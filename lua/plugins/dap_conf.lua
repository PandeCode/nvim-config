local dap = require("dap")

vim.keymap.set(Keys.N, "<LEADER>db", dap.toggle_breakpoint, Keys.Noremap)
vim.keymap.set(Keys.N, "<LEADER>d<SPACE>", dap.continue, Keys.Noremap)
vim.keymap.set(Keys.N, "<LEADER>ds", dap.step_over, Keys.Noremap)
vim.keymap.set(Keys.N, "<LEADER>do", dap.repl.open, Keys.Noremap)

function getcppdbg()
	vim.cmd([[
!sh -c "mkdir -p ~/.cache/cppdgb; \
	cd ~/.cache/cppgdb; \
	wget -c $(curl -fsSL https://api.github.com/repos/microsoft/vscode-cpptools/releases/latest | jq -r '.assets[] | .browser_download_url' | grep linux.vsix); \
	chmod +x /extension/debugAdapters/bin/OpenDebugAD7 ./extension/debugAdapters/bin/createdump ./extension/bin/cpptools*"
]])
end

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = vim.fn.expand("~/.cache/cppdgb/extension/debugAdapters/bin/OpenDebugAD7"),
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
		miDebuggerPath = "/usr/bin/gdb",
		cwd = "${workspaceFolder}",
		program = function()
			return vim.fn.input("bin: ", vim.fn.getcwd() .. "/", "file")
		end,
	},
}

dap.configurations.c = dap.configurations.cpp 
dap.configurations.rust = dap.configurations.cpp 
