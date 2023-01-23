-- Select target for running / debugging.
vim.api.nvim_set_keymap(Keys.N, "<Space>ctt", ":Telescope cmake select_target", Keys.Noremap)
-- Create new CMake project.
vim.api.nvim_set_keymap(Keys.N, "<Space>ctp", ":Telescope cmake create_project", Keys.Noremap)
-- Select build type (Release, Debug, etc.).
vim.api.nvim_set_keymap(Keys.N, "<Space>ctb", ":Telescope cmake select_build_type", Keys.Noremap)

vim.api.nvim_set_keymap(Keys.N, "<Space>cg", ":CMake configure<cr>", Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N, "<Space>cb", ":CMake build<cr>", Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N, "<Space>cc", ":CMake clean<cr>", Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N, "<Space>cr", ":CMake build_and_run<cr>", Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N, "<Space>cd", ":CMake debug<cr>", Keys.Noremap)

local Path = require("plenary.path")
require("cmake").setup({
	-- cmake_executable = "cmake", -- CMake executable to run.
	save_before_build = false, -- Save all buffers before building.
	-- parameters_file = "neovim.json", -- JSON file to store information about selected target, run arguments and build type.
	default_parameters = { 
		run_dir = vim.fn.getcwd(),
		args = {},
		build_type = "Debug",

	}, -- The default values in `parameters_file`. Can also optionally contain `run_dir` with the working directory for applications.
	-- build_dir = tostring(Path:new("{cwd}", "build", "{os}-{build_type}")), -- Build directory. The expressions `{cwd}`, `{os}` and `{build_type}` will be expanded with the corresponding text values. Could be a function that return the path to the build directory.
	-- samples_path = tostring(script_path:parent():parent():parent() / "samples"), -- Folder with samples. `samples` folder from the plugin directory is used by default.
	default_projects_path = tostring(Path:new(vim.loop.os_homedir(), "dev")), -- Default folder for creating project.
	-- configure_args = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- Default arguments that will be always passed at cmake configure step. By default tells cmake to generate `compile_commands.json`.
	-- build_args = {}, -- Default arguments that will be always passed at cmake build step.
	-- on_build_output = nil, -- Callback that will be called each time data is received by the current process. Accepts the received data as an argument.
	-- quickfix = {
	--     pos = "botright", -- Where to open quickfix
	--     height = 10, -- Height of the opened quickfix.
	--     only_on_error = false, -- Open quickfix window only if target build failed.
	-- },
	-- copy_compile_commands = true, -- Copy compile_commands.json to current working directory.
	-- dap_configurations = { -- Table of different DAP configurations.
	--     lldb_vscode = { type = "lldb", request = "launch" },
	--     cppdbg_vscode = { type = "cppdbg", request = "launch" },
	-- },
	-- dap_configuration = "lldb_vscode", -- DAP configuration to use if the projects `parameters_file` does not specify one.
	-- dap_open_command = function(...)
	--     require("dap").repl.open(...)
	-- end, -- Command to run after starting DAP session. You can set it to `false` if you don't want to open anything or `require('dapui').open` if you are using https://github.com/rcarriga/nvim-dap-ui
})
