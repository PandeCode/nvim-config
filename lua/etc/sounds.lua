local function convert_volume(human_volume)
	local clamped_volume = math.max(0, math.min(100, human_volume))
	local paplay_volume = math.floor(clamped_volume * 655.36)
	return paplay_volume
end

local function play_sound(path, human_volume)
	local paplay_volume = convert_volume(human_volume)
	vim.fn.system(string.format("paplay %s --volume=%d &", path, paplay_volume))
end

local sound_dir = vim.fn.expand("~/.config/nvim/sounds/")

local function mk_sound(ev, ogg, human_volume)
	vim.api.nvim_create_autocmd({ ev }, {
		pattern = "*",
		callback = function()
			local path = sound_dir .. ogg .. ".wav"
			play_sound(path, human_volume)
		end,
	})
end

mk_sound("BufRead", "1real", 100)
mk_sound("CursorMovedI", "space", 100)
mk_sound("InsertLeave", "backspace", 100)
mk_sound("ExitPre", "enter", 100)
mk_sound("BufWrite", "11real", 100)
