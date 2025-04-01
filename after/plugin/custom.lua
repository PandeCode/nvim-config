-- A Neovim plugin to check for and source custom_nvim.lua from the current working directory
--
-- Function to check if a file exists
local function file_exists(file)
	local f = io.open(file, "r")
	if f then
		f:close()
		return true
	end
	return false
end

-- Function to source the custom_nvim.lua file
function source_custom_config()
	local cwd = vim.fn.getcwd()
	local custom_config_path = cwd .. "/custom_nvim.lua"

	if file_exists(custom_config_path) then
		vim.notify("Sourcing custom config from: " .. custom_config_path, vim.log.levels.INFO)
		-- Use protected call to prevent errors from breaking Neovim
		local ok, err = pcall(dofile, custom_config_path)
		if not ok then
			vim.notify("Error sourcing custom config: " .. err, vim.log.levels.ERROR)
		end
	end
end

-- Create an autocommand to source custom_nvim.lua when entering a directory
vim.api.nvim_create_autocmd("DirChanged", {
	pattern = "*",
	callback = function()
		source_custom_config()
	end,
	desc = "Source custom_nvim.lua when changing directories",
})

source_custom_config()
