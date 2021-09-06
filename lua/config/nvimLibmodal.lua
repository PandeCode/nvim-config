local WinResizeMode   = {
	["j"]       = "wincmd -",
	["<down>"]  = "wincmd -",
	["k"]       = "wincmd +",
	["<up>"]    = "wincmd +",
	["h"]       = "wincmd <",
	["<left>"]  = "wincmd <",
	["l"]       = "wincmd >",
	["<right>"] = "wincmd >"
}

function CallWinResizeMode()
	require("libmodal").mode.enter("WinResizeMode", WinResizeMode)
end

vim.api.nvim_set_keymap(
	"n", "<leader>wr", ":lua CallWinResizeMode()<cr>", {noremap = true}
)

local WinMoveMode   = {
	["j"]       = "wincmd J",
	["<down>"]  = "wincmd J",
	["k"]       = "wincmd K",
	["<up>"]    = "wincmd K",
	["h"]       = "wincmd H",
	["<left>"]  = "wincmd H",
	["l"]       = "wincmd L",
	["<right>"] = "wincmd L"
}

function CallWinMoveMode()
	require("libmodal").mode.enter("WinMoveMode", WinMoveMode)
end

vim.api.nvim_set_keymap(
	"n", "<leader>wm", ":lua CallWinMoveMode()<cr>", {noremap = true}
)
