local function create_source_binding(pattern, callback, group, binding)
	pattern = pattern or { "*" }
	callback = callback or function() end
	group = group or RandStr(10)
	binding = binding or "<LEADER>sf"

	vim.api.nvim_create_autocmd("BufEnter", {
		pattern = pattern,
		group = vim.api.nvim_create_augroup(group, { clear = true }),
		callback = function(tbl)
			vim.keymap.set(Keys.N, binding, function()
				callback(tbl)
				vim.notify(
					"Sourced file '" .. vim.fn.expand("%") .. "'",
					"info",
					{ title = IDE.name .. " : " .. group }
				)
			end, { silent = true, buffer = tbl.buf })
		end,
	})
end

create_source_binding({ "*.vim", "*.lua" }, function()
	vim.cmd.source()
end, "SourceVimscriptLua")
create_source_binding({ "*/config/sxhkd/**" }, function()
	vim.fn.jobstart({
		"sh",
		"-c",
		'"killall -9 sxhkd ; sxhkd -c ' .. vim.fn.expand("%") .. ' & disown"',
	})
end, "SourceSxhkd")
create_source_binding({ "*config/xmobar/**" }, function()
	vim.fn.jobstart({ "sh", "-c", '"killall -9 xmobar ; xmobar & disown"' })
end, "SourceXmobar")
create_source_binding({ "*config/tmux/**", "*tmux.conf" }, function()
	vim.fn.jobstart({ "tmux", "source", vim.fn.expand("%") })
end, "SourceTmux")
create_source_binding({ "*.cpp" }, function()
	vim.cmd("!runcpp " .. vim.fn.expand("%"))
end, "SourceCpp", "<LEADER>rc")
create_source_binding({ "*/waybar/**/*.*" }, function()
	vim.fn.jobstart({ "sh", "-c", "'!killall -9 waybar ; waybar & disown'" })
end, "SourceWaybar")

