WinResizeMode   = {
	["j"]       = "echom \"Hello down\"",
	["k"]       = "echom \"Hello up\"",
	["h"]       = "echom \"Hello left\"",
	["l"]       = "echom \"Hello right\"",
	["<down>"]  = "echom \"Hello down\"",
	["<up>"]    = "echom \"Hello up\"",
	["<left>"]  = "echom \"Hello left\"",
	["<right>"] = "echom \"Hello right\""
}

function CallWinResizeMode()
	require("libmodal").mode.enter("WinResizeMode", WinResizeMode)
end

vim.api.nvim_set_keymap(
	"n", "<leader>wr", ":lua CallWinResizeMode()<cr>", {noremap = true}
)

CallWinResizeMode()
