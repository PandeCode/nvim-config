require("plenary.reload").reload_module("popup")

local popup = require("popup")
local http_request = require("http.request")
local socket_http = require("http.compat.socket")
local commandBaseUri = "http://localhost:8080/command/"

local function httpGet(uri)
	local new_http_variable = http_request.new_from_uri(uri)
	local headers, stream = assert(new_http_variable:go())
	--for lua_field, lua_value in headers:each() do
	--print(lua_field, lua_value)
	--end
	local body_http_variable = assert(stream:get_body_as_string())
	return body_http_variable, headers
end

Spotify = {
	dbus = {
		__dbusBase = "AsyncRun dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.",
		__PlayPauseStr = "PlayPause",
		__NextStr = "Next",
		__PreviousStr = "Previous",
		__PlayStr = "Play",
		__PauseStr = "Pause",
		info = function()
			local currentSong = vim.api.nvim_exec("!playerctl --player=spotify metadata artist title", true)
			currentSong = string.gsub(string.sub(currentSong, 53, string.len(currentSong)), "\n", "")
			-- vim.cmd ("Echo \"" .. currentSong .."\"")
			popup.create(currentSong, {
				enter = false,
				-- line = 3,
				-- col = 11,
				-- minwidth = 20,
				-- cursorline = true,
				title = "Spotify",
				border = {},
				padding = {},
				pos = "botright",
				time = 2000,
			})
		end,
		pause = function()
			vim.api.nvim_command(Spotify.dbus.__dbusBase .. Spotify.dbus.__PauseStr)
			Spotify.dbus.info()
		end,
		play = function()
			vim.api.nvim_command(Spotify.dbus.__dbusBase .. Spotify.dbus.__PlayStr)
			Spotify.dbus.info()
		end,
		next = function()
			vim.api.nvim_command(Spotify.dbus.__dbusBase .. Spotify.dbus.__NextStr)
			Spotify.dbus.info()
		end,
		previous = function()
			vim.api.nvim_command(Spotify.dbus.__dbusBase .. Spotify.dbus.__PreviousStr)
			Spotify.dbus.info()
		end,
		playPause = function()
			vim.api.nvim_command(Spotify.dbus.__dbusBase .. Spotify.dbus.__PlayPauseStr)
			Spotify.dbus.info()
		end,
	},

	http = {
		playPause = function()
			httpGet(commandBaseUri .. "playPause")
		end,
		play = function()
			httpGet(commandBaseUri .. "play")
		end,
		pause = function()
			httpGet(commandBaseUri .. "pause")
		end,
		runCode = function(code)
			httpGet("https://localhost:8080/code/" .. code)
		end,
		next = function()
			httpGet(commandBaseUri .. "next")
		end,
		previous = function()
			httpGet(commandBaseUri .. "previous")
		end,
		toggleShuffle = function()
			httpGet(commandBaseUri .. "toggleShuffle")
		end,
		shuffleOn = function()
			httpGet(commandBaseUri .. "shuffleOn")
		end,
		shuffleOff = function()
			httpGet(commandBaseUri .. "shuffleOff")
		end,
		getRepeatStatus = function()
			httpGet(commandBaseUri .. "getRepeatStatus")
		end,
		disableRepeat = function()
			httpGet(commandBaseUri .. "disableRepeat")
		end,
		enableRepeatAll = function()
			httpGet(commandBaseUri .. "enableRepeatAll")
		end,
		enableRepeat = function()
			httpGet(commandBaseUri .. "enableRepeat")
		end,
		getIsCurrentLiked = function()
			httpGet(commandBaseUri .. "getIsCurrentLiked")
		end,
		toggleLikeCurrent = function()
			httpGet(commandBaseUri .. "toggleLikeCurrent")
		end,
		likeCurrent = function()
			httpGet(commandBaseUri .. "likeCurrent")
		end,
		dislikeCurrent = function()
			httpGet(commandBaseUri .. "dislikeCurrent")
		end,
	},
	websocket = {
		client = nil,

		connectWs = function()
			local new_http_variable = http_request.new_from_uri("http://localhost:8080/client/ws")
			local headers, stream = assert(new_http_variable:go())

			--local body, code = assert(socket_http.request("http://localhost:8080/client/ws"))
			--print(code, #body) --> 200, 2514

			for lua_field, lua_value in headers:each() do
				print(lua_field, lua_value)
			end
			local body_http_variable = assert(stream:get_body_as_string())
			print(body_http_variable)
		end,
		playPauseWs = function()
			Spotify.websocket.connectWs()
		end,
		pauseWs = function() end,
		playWs = function() end,
	},
}


-- stylua: ignore start
vim.api.nvim_set_keymap(Keys.N,      "<SPACE>si",       "<CMD>lua Spotify.dbus.info()<CR>",      Keys.NoremapSilent)
vim.api.nvim_set_keymap(Keys.N,      "<SPACE>sn",       "<CMD>lua Spotify.dbus.next()<CR>",      Keys.NoremapSilent)
vim.api.nvim_set_keymap(Keys.N,      "<SPACE>sp",       "<CMD>lua Spotify.dbus.previous()<CR>",      Keys.NoremapSilent)
vim.api.nvim_set_keymap(Keys.N,      "<SPACE>s<SPACE>", "<CMD>lua Spotify.dbus.playPause()<CR>", Keys.NoremapSilent)
-- stylua: ignore end
