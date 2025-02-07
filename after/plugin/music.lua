local client_id = vim.env.SPOTIFY_CLIENT_ID or vim.fn.system "head -n 1 ~/.config/spotify_client" -- or vim.fn.system "pass spotify.nvim/client-id"
local client_secret = vim.env.SPOTIFY_CLIENT_SECRET or vim.fn.system "tail -n 1 ~/.config/spotify_client" -- or vim.fn.system "pass spotify.nvim/client-secret"

if not client_id or not client_secret or client_id == "" or client_secret == "" then
	vim.notify("Spotify client credentials are missing", vim.log.levels.ERROR)
	return
end

require("spotify").setup {
	client_id = client_id,
	client_secret = client_secret,
}

local cache_dir = vim.fn.stdpath "cache" .. "/spotify_cache"
vim.fn.mkdir(cache_dir, "p")

local function cache_http_get(url)
	local cache_file = cache_dir .. "/" .. vim.fn.sha256(url)

	if vim.fn.filereadable(cache_file) == 1 then
		local cached_content = vim.fn.readfile(cache_file)
		return {
			status = 200,
			body = table.concat(cached_content, "\n"),
		}
	end

	local http = require "plenary.curl"
	local response = http.get { url = url }

	if response and response.status == 200 then
		vim.fn.writefile(vim.split(response.body, "\n"), cache_file)
	end

	return response
end

local function getLyrics(artists, songName)
	local query
	if type(artists) == "table" then
		query = table.concat(artists, " ") .. " " .. songName
	else
		query = artists .. " " .. songName
	end

	local url = "https://lrclib.net/api/search?q=" .. query:gsub(" ", "%%20")
	local response = cache_http_get(url)

	if response and response.status == 200 then
		local decoded = vim.fn.json_decode(response.body)
		local lyrics = decoded[1] and decoded[1].plainLyrics or "No lyrics found"
		return lyrics
	else
		vim.notify("Failed to fetch lyrics", vim.log.levels.ERROR)
	end
end

local function getSyncedLyrics(artists, songName)
	local query
	if type(artists) == "table" then
		query = table.concat(artists, " ") .. " " .. songName
	else
		query = artists .. " " .. songName
	end

	local url = "https://lrclib.net/api/search?q=" .. query:gsub(" ", "%%20")
	local response = cache_http_get(url)

	if response and response.status == 200 then
		local decoded = vim.fn.json_decode(response.body)
		local lyrics = decoded[1] and decoded[1].syncedLyrics or "No lyrics found"
		return lyrics
	else
		vim.notify("Failed to fetch lyrics", vim.log.levels.ERROR)
	end
end

local function milliseconds_to_display_time(ms)
	local total_seconds = math.floor(ms / 1000)
	local hours = math.floor(total_seconds / 3600)
	local minutes = math.floor((total_seconds % 3600) / 60)
	local seconds = total_seconds % 60

	if hours > 0 then
		return string.format("%02d:%02d:%02d", hours, minutes, seconds)
	else
		return string.format("%02d:%02d", minutes, seconds)
	end
end

local function printLyrics()
	local api = require "spotify.api"
	local response = api.call "/me/player/currently-playing"

	if not response then
		vim.notify("Spotify API: nothing currently playing", vim.log.levels.WARN)
		return
	end

	if response.currently_playing_type == "track" then
		local track = {
			artists = vim.tbl_map(function(artist)
				return artist.name
			end, response.item.artists),
			album = response.item.album.name,
			name = response.item.name,
			release_date = response.item.album.release_date,
			progress = string.format(
				"%s/%s",
				milliseconds_to_display_time(response.progress_ms),
				milliseconds_to_display_time(response.item.duration_ms)
			),
			is_playing = response.is_playing,
		}

		-- Get lyrics
		local lyrics = getLyrics(track.artists, track.name)
		if not lyrics or lyrics == "" then
			lyrics = "No lyrics available"
		end

		-- Prepare content for the floating window
		local lines = {
			"Currently Playing: " .. track.name,
			"Artists: " .. table.concat(track.artists, ", "),
			"Album: " .. track.album,
			"Progress: " .. track.progress,
			"",
			"Lyrics:",
		}
		vim.list_extend(lines, vim.split(lyrics, "\n"))

		-- Create a floating window to display the information
		local buf = vim.api.nvim_create_buf(false, true)
		local width = math.floor(vim.o.columns * 0.8)
		local height = math.floor(vim.o.lines * 0.6)
		local row = math.floor((vim.o.lines - height) / 2)
		local col = math.floor((vim.o.columns - width) / 2)
		vim.api.nvim_open_win(buf, true, {
			relative = "editor",
			width = width,
			height = height,
			row = row,
			col = col,
			style = "minimal",
			border = "rounded",
		})
		vim.api.nvim_set_option_value("modifiable", true, { buf = buf })
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
		vim.api.nvim_set_option_value("modifiable", false, { buf = buf })
	else
		vim.notify(vim.inspect(response))
	end
end

local function get_device_id()
	local api = require "spotify.api"
	local devices = api.call("/me/player/devices").devices

	if not devices or #devices == 0 then
		vim.notify("No Spotify devices found", vim.log.levels.WARN)
		return nil
	end

	local active_device = vim.tbl_filter(function(device)
		return device.is_active
	end, devices)[1]
	return active_device and active_device.id or devices[1].id
end

local function make_play_id(type, id)
	return function()
		local device_id = get_device_id()
		if not device_id then
			vim.notify("Open Spotify first!", vim.log.levels.ERROR)
			return
		end

		require("spotify.api").call("/me/player/play?device_id=" .. device_id, "put", {
			context_uri = "spotify:" .. type .. ":" .. id,
		})

		vim.notify("Playing " .. type .. ":" .. id)
	end
end

vim.keymap.set("n", "<leader>mpn", make_play_id("playlist", "31tiOUl2jhbng5lC8Rh46E"))
vim.keymap.set("n", "<leader>mc", require("spotify.api").currently_playing)
vim.keymap.set("n", "<leader>ml", require("spotify.api").like_current_track)
vim.keymap.set("n", "<leader>mw", printLyrics)

local function displaySyncedLyrics()
	local api = require "spotify.api"
	local buf

	local function getSyncedLyricLine(lyrics, progress_ms)
		for i, line in ipairs(lyrics) do
			local time, text = line:match "%[(%d+:%d+%.%d+)%]%s*(.*)"
			if time then
				local time_ms = tonumber(time:match "^(%d+):%d+%.%d+" or "0") * 60000
				time_ms = time_ms + tonumber(time:match "^%d+:(%d+)%.%d+" or "0") * 1000
				time_ms = time_ms + tonumber(time:match "%.(%d+)$" or "0")

				if progress_ms < time_ms then
					return i > 1 and i - 1 or 1
				end
			end
		end
		return #lyrics
	end

	local function updateSyncedLyrics()
		if not vim.api.nvim_buf_is_valid(buf) then
			return -- Stop if the buffer has been closed
		end

		local response = api.call "/me/player/currently-playing"

		if not response then
			vim.notify("Spotify API: nothing currently playing", vim.log.levels.WARN)
			return
		end

		if response.currently_playing_type == "track" then
			local track = {
				artists = vim.tbl_map(function(artist)
					return artist.name
				end, response.item.artists),
				name = response.item.name,
				progress = response.progress_ms,
			}

			local syncedLyrics = getSyncedLyrics(track.artists, track.name)
			if not syncedLyrics or syncedLyrics == "" then
				syncedLyrics = "No synced lyrics available"
			end

			local lyricsLines = vim.split(syncedLyrics, "\n")
			local currentLineIndex = getSyncedLyricLine(lyricsLines, track.progress)

			vim.api.nvim_set_option_value("modifiable", true, { buf = buf })
			vim.api.nvim_buf_set_lines(buf, 0, -1, false, lyricsLines)
			vim.api.nvim_set_option_value("modifiable", false, { buf = buf })
			vim.api.nvim_buf_clear_namespace(buf, -1, 0, -1)

			if lyricsLines[currentLineIndex] then
				vim.api.nvim_buf_add_highlight(buf, -1, "Visual", currentLineIndex - 1, 0, -1)
			end

			vim.defer_fn(updateSyncedLyrics, 3000) -- Call every 3 seconds
		else
			vim.notify("Spotify is not playing a track.", vim.log.levels.WARN)
		end
	end

	-- Create a floating window
	buf = vim.api.nvim_create_buf(false, true)
	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.6)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	})

	-- vim.api.nvim_buf_set_option(buf, "modifiable", false)

	updateSyncedLyrics()
end

vim.keymap.set("n", "<leader>ms", displaySyncedLyrics)
