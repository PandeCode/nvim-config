if vim.g.vscode ~= nil then
	return {}
end

local function get_cpp_exe()
	local cwd = vim.fn.getcwd()
	local _dir = vim.split(cwd, "/")
	local dir = _dir[#_dir]

	return vim.fn.input("Path to executable: ", cwd .. "/build/bin/Debug/" .. dir, "file")
end

local M = {
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		ft = { "rust", "c", "cpp" },

		keys = {
			{ "<LEADER>tdc", ":Telescope dap commands<CR>", desc = "DAP Commands" },
			{ "<LEADER>tdf", ":Telescope dap configurations<CR>", desc = "DAP Configurations" },
			{ "<LEADER>tdl", ":Telescope dap list_breakpoints<CR>", desc = "DAP List Breakpoints" },
			{ "<LEADER>tdv", ":Telescope dap variables<CR>", desc = "DAP Variables" },
			{ "<LEADER>tdf", ":Telescope dap frames<CR>", desc = "DAP Frames" },

			{ "<LEADER>d<SPACE>", ":DapContinue<CR>", desc = "DAP Continue" },
			{ "<LEADER>db", ":DapToggleBreakpoint<CR>", desc = "DAP Toggle Breakpoint" },
			{ "<LEADER>de", ":DapEval<CR>", desc = "DAP Evaluate" },
			{ "<LEADER>dr", ":DapToggleRepl<CR>", desc = "DAP Toggle REPL" },
			{ "<LEADER>dsi", ":DapStepInto<CR>", desc = "DAP Step Into" },
			{ "<LEADER>dsu", ":DapStepOut<CR>", desc = "DAP Step Out" },
			{ "<LEADER>dsv", ":DapStepOver<CR>", desc = "DAP Step Over" },
		},

		dependencies = {
			"nvim-neotest/nvim-nio",
			{
				"nvim-telescope/telescope-dap.nvim",
				dependencies = { "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap" },
			},
			{ "theHamsta/nvim-dap-virtual-text", dependencies = { "mfussenegger/nvim-dap" }, opts = {} },
		},
		config = function()
			local dap, dapui = require "dap", require "dapui"
			dapui.setup()

			dap.adapters = {
				godot = {
					type = "server",
					host = "127.0.0.1",
					port = 6006,
				},
				-- cppdbg = {
				-- 	type = "executable",
				-- 	id = "cppdbg",
				-- 	command = "OpenDebugAD7",
				-- },
				codelldb = {
					type = "server",
					port = "13000",
					id = "codelldb",
					executable = {
						command = "codelldb",
						args = { "--port", "13000" },
					},
				},
			}

			dap.configurations = {
				cpp = {
					-- {
					-- 	name = "Launch file",
					-- 	type = "cppdbg",
					-- 	request = "launch",
					-- 	program = get_cpp_exe,
					-- 	cwd = "${workspaceFolder}",
					-- 	stopAtEntry = true,
					-- 	setupCommands = {
					-- 		{
					-- 			text = "-enable-pretty-printing",
					-- 			description = "enable pretty printing",
					-- 			ignoreFailures = false,
					-- 		},
					-- 	},
					-- },
					-- {
					-- 	name = "Attach to gdbserver :1234",
					-- 	type = "cppdbg",
					-- 	request = "launch",
					-- 	MIMode = "gdb",
					-- 	miDebuggerServerAddress = "localhost:1234",
					-- 	miDebuggerPath = "gdb",
					-- 	cwd = "${workspaceFolder}",
					-- 	program = get_cpp_exe,
					-- 	setupCommands = {
					-- 		{
					-- 			text = "-enable-pretty-printing",
					-- 			description = "enable pretty printing",
					-- 			ignoreFailures = false,
					-- 		},
					-- 	},
					-- },
					{
						name = "Launch file",
						type = "codelldb",
						request = "launch",
						program = get_cpp_exe,
						cwd = "${workspaceFolder}",
						stopOnEntry = false,
					},
				},
				gdscript = {
					{
						type = "godot",
						request = "launch",
						name = "Launch scene",
						project = "${workspaceFolder}",
					},
				},
			}

			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp

			require("telescope").load_extension "dap"

			-- stylua: ignore start
			dap.listeners.before.attach.dapui_config           = function() dapui.open() end
			dap.listeners.before.launch.dapui_config           = function() dapui.open() end
			dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
			dap.listeners.before.event_exited.dapui_config     = function() dapui.close() end
			-- stylua: ignore end
		end,
	},
}

return M
