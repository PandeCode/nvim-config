local popup = require("plenary.popup");

Spotify = {
	__dbusBase = "AsyncRun dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.",
	__PlayPauseStr = "PlayPause",
	__NextStr = "Next",
	__PreviousStr = "Previous",
	__PlayStr = "Play",
	__PauseStr = "Pause",

	info = function()
		local currentSong = vim.api.nvim_exec(
			                    "!playerctl --player=spotify metadata artist title", true
		                    );
		currentSong = string.gsub(
			              string.sub(currentSong, 53, string.len(currentSong)), "\n", ""
		              );
		popup.create(
			currentSong,
			{line = 3, col = 11, minwidth = 20, border = {}, pos = "topright"}
		);
	end,

	pause = function()
		vim.api.nvim_command(Spotify.__dbusBase .. Spotify.__PauseStr)
		Spotify.info();
	end,
	play = function()
		vim.api.nvim_command(Spotify.__dbusBase .. Spotify.__PlayStr)
		Spotify.info();
	end,
	next = function()
		vim.api.nvim_command(Spotify.__dbusBase .. Spotify.__NextStr)
		Spotify.info();
	end,
	prev = function()
		vim.api.nvim_command(Spotify.__dbusBase .. Spotify.__PreviousStr)
		Spotify.info();
	end,
	playPause = function()
		vim.api.nvim_command(Spotify.__dbusBase .. Spotify.__PlayPauseStr)
		Spotify.info();
	end
}

local noremap = {noremap = true, silent = true}
vim.api
	.nvim_set_keymap("n", "<space>si", "<cmd>lua Spotify.info()<cr>", noremap);
vim.api
	.nvim_set_keymap("n", "<space>sn", "<cmd>lua Spotify.next()<cr>", noremap);
vim.api
	.nvim_set_keymap("n", "<space>sp", "<cmd>lua Spotify.prev()<cr>", noremap);
vim.api.nvim_set_keymap(
	"n", "<space>s<space>", "<cmd>lua Spotify.playPause()<cr>", noremap
);
