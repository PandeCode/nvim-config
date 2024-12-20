return {
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		ft = { "rust", "c", "cpp" },
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap, dapui = require "dap", require "dapui"
			dap.setup()
			dapui.setup()

			dap.adapters.codelldb = {
				type = "server",
				port = "13000",
				executable = {
					-- FIXME Future Nix Overlay
					command = "/absolute/path/to/codelldb/extension/adapter/codelldb",
					args = { "--port", "13000" },

					-- On windows you may have to uncomment this:
					-- detached = false,
				},
			}

			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						local cwd = vim.fn.getcwd()
						local _dir = vim.split(cwd, "/")
						local dir = _dir[#_dir]

						return vim.fn.input("Path to executable: ", cwd .. "/build/bin/Debug/" .. dir, "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}

			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp

			require("telescope").load_extension "dap"

			-- stylua: ignore start
			dap.listeners.before.attach.dapui_config = function() dapui.open() end
			dap.listeners.before.launch.dapui_config = function() dapui.open() end
			dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
			dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
			-- stylua: ignore end
		end,
	},
}
