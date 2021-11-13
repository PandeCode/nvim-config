require("plenary.reload").reload_module("popup")

local popup = require("popup")

local http_headers = require("http.headers")
local http_request = require("http.request")
local http_websocket = require("http.websocket")
local commandBaseUri = "http://localhost:8080/command/"

---@diagnostic disable-next-line: unused-function, unused-local
local function printHeaders(headers)
	for lua_field, lua_value in headers:each() do
		print(lua_field, lua_value)
	end
end

local function httpGet(uri)
	local new_http_variable = http_request.new_from_uri(uri)
	local headers, stream = assert(new_http_variable:go())
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
		code = function(text)
			local requestHeaders = http_headers.new()
			requestHeaders:append("Content-Type", "application/json")
			requestHeaders:append("Accept", "application/json")
			requestHeaders:append(":method", "POST")

			local request = http_request.new_from_uri("http://localhost:8080/code", requestHeaders)
			request:set_body('{"command": "' .. text .. '"}')

			local headers, stream = assert(request:go())
			local body_http_variable = assert(stream:get_body_as_string())
			return body_http_variable, headers
		end,
		reload = function()
			Spotify.http.code("location.href=location.href")
		end,
		displayNone = function()
			Spotify.http.code("document.querySelector('html').style.display='none'")
		end,
	},

	websocket = {
		clientServer = "ws://localhost:8080/client/ws",
		client = nil,
		reset = function()
			Spotify.websocket.client = nil
		end,

		connect = function()
			if Spotify.websocket.client == nil then
				Spotify.websocket.client = http_websocket.new_from_uri(Spotify.websocket.clientServer)
				Spotify.websocket.client:connect()
				return true
			end
			return true
		end,

		code = function(code)
			assert(Spotify.websocket.connect())
			Spotify.websocket.client:send('{"type": "code", "message": "' .. code .. '"}')
		end,

		next = function()
			assert(Spotify.websocket.connect())
			Spotify.websocket.client:send('{"type": "command", "message": "next"}')
		end,
		play = function()
			assert(Spotify.websocket.connect())
			Spotify.websocket.client:send('{"type": "command", "message": "play"}')
		end,
		pause = function()
			assert(Spotify.websocket.connect())
			Spotify.websocket.client:send('{"type": "command", "message": "pause"}')
		end,
		previous = function()
			assert(Spotify.websocket.connect())
			Spotify.websocket.client:send('{"type": "command", "message": "previous"}')
		end,
		playPause = function()
			assert(Spotify.websocket.connect())
			Spotify.websocket.client:send('{"type": "command", "message": "playPause"}')
		end,
		playState = function()
			assert(Spotify.websocket.connect())
			Spotify.websocket.client:send('{"type": "command", "message": "playState"}')
		end,
		likeCurrent = function()
			assert(Spotify.websocket.connect())
			Spotify.websocket.client:send('{"type": "command", "message": "likeCurrent"}')
		end,
		enableRepeat = function()
			assert(Spotify.websocket.connect())
			Spotify.websocket.client:send('{"type": "command", "message": "enableRepeat"}')
		end,
		repeatStatus = function()
			assert(Spotify.websocket.connect())
			Spotify.websocket.client:send('{"type": "command", "message": "repeatStatus"}')
		end,
		toggleShuffle = function()
			assert(Spotify.websocket.connect())
			Spotify.websocket.client:send('{"type": "command", "message": "toggleShuffle"}')
		end,
		dislikeCurrent = function()
			assert(Spotify.websocket.connect())
			Spotify.websocket.client:send('{"type": "command", "message": "dislikeCurrent"}')
		end,
		isCurrentLiked = function()
			assert(Spotify.websocket.connect())
			Spotify.websocket.client:send('{"type": "command", "message": "isCurrentLiked"}')
		end,
		enableRepeatOne = function()
			assert(Spotify.websocket.connect())
			Spotify.websocket.client:send('{"type": "command", "message": "enableRepeatOne"}')
		end,
		disableRepeatOne = function()
			assert(Spotify.websocket.connect())
			Spotify.websocket.client:send('{"type": "command", "message": "disableRepeatOne"}')
		end,
		toggleLikeCurrent = function()
			assert(Spotify.websocket.connect())
			Spotify.websocket.client:send('{"type": "command", "message": "toggleLikeCurrent"}')
		end,

		reload = function()
			Spotify.websocket.code("location.href=location.href")
		end,
		displayNone = function()
			Spotify.websocket.code("document.querySelector('html').style.display='none'")
		end,

	},
}


-- stylua: ignore start
vim.api.nvim_set_keymap(Keys.N, "<SPACE>si",       "<CMD>lua Spotify.dbus.info()<CR>",      Keys.NoremapSilent)
vim.api.nvim_set_keymap(Keys.N, "<SPACE>sn",       "<CMD>lua Spotify.dbus.next()<CR>",      Keys.NoremapSilent)
vim.api.nvim_set_keymap(Keys.N, "<SPACE>sp",       "<CMD>lua Spotify.dbus.previous()<CR>",  Keys.NoremapSilent)
vim.api.nvim_set_keymap(Keys.N, "<SPACE>s<SPACE>", "<CMD>lua Spotify.dbus.playPause()<CR>", Keys.NoremapSilent)
-- stylua: ignore end
