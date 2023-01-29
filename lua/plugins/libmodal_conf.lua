local WinResizeMode = {
	["j"] = "wincmd -",
	["<down>"] = "wincmd -",
	["k"] = "wincmd +",
	["<up>"] = "wincmd +",
	["h"] = "wincmd <",
	["<left>"] = "wincmd <",
	["l"] = "wincmd >",
	["<right>"] = "wincmd >"
}
local WinMoveMode = {
	["j"] = "wincmd J",
	["<down>"] = "wincmd J",
	["k"] = "wincmd K",
	["<up>"] = "wincmd K",
	["h"] = "wincmd H",
	["<left>"] = "wincmd H",
	["l"] = "wincmd L",
	["<right>"] = "wincmd L"
}

local libmodal_mode_enter_fn = function(name, list)
	return function() require("libmodal").mode.enter(name, list) end
end

vim.keymap.set(
	Keys.N, "<LEADER>wm", libmodal_mode_enter_fn("WinMoveMode", WinMoveMode),
	Keys.Noremap
)
vim.keymap.set(
	Keys.N, "<LEADER>wr", libmodal_mode_enter_fn("WinResizeMode", WinResizeMode),
	Keys.Noremap
)
