-- local should_profile = "start"
local should_profile = false

local profilepath = vim.fn.stdpath("data") .. "/profile.nvim"

if not vim.loop.fs_stat(profilepath) then
	vim.fn.system({
		"git",
		"clone",
		"--depth=1",
		"https://github.com/stevearc/profile.nvim",
		profilepath,
	})
end
vim.opt.rtp:prepend(profilepath)

if should_profile then
	require("profile").instrument_autocmds()
	if should_profile:lower():match("^start") then
		require("profile").start("*")
	else
		require("profile").instrument("*")
	end
end

local function toggle_profile()
	local prof = require("profile")
	if prof.is_recording() then
		prof.stop()
		vim.ui.input({ prompt = "Save profile to:", completion = "file", default = "profile.json" }, function(filename)
			if filename then
				prof.export(filename)
				vim.notify(string.format("Wrote %s", filename))
			end
		end)
	else
		prof.start("*")
	end
end
vim.keymap.set("", "<F3>", toggle_profile)
