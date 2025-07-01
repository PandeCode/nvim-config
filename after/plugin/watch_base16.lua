if vim.env.THEME_WATCH then
	local uv = vim.uv
	local fse = uv.new_fs_event()
	local path = vim.fs.normalize "~/.config/stylix/nvim.lua"

	uv.fs_event_start(fse, path, {
		--"watch_entry"=true,"stat"=true,
		recursive = true,
	}, function()
		vim.cmd "source ~/.config/nvim/after/plugin/theme.lua"
		vim.notify("Switched Themes", vim.log.levels.INFO)
	end)

	vim.notify("Now watching ~/.config/stylix/nvim.lua for external changes", vim.log.levels.INFO)
end
