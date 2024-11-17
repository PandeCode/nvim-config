vim.g.indentLine_fileTypeExclude = { "dashboard" }
vim.cmd("autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2")

local img_dir = "~/.config/nvim/startup_images/"
local image_files = listdir(vim.fn.expand(img_dir))
local header = vim.fn.readfile(vim.fn.expand(img_dir .. image_files[math.random(1, #image_files)]))

require("dashboard").setup({
	theme = "hyper",
	config = {
		header = header,
		shortcut = {
			{
				desc = " Update",
				group = "@property",
				action = "Lazy update",
				key = "u",
			},
			{
				desc = " Files",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				desc = " Apps",
				group = "DiagnosticHint",
				action = "Telescope app",
				key = "a",
			},
			{
				desc = " dotfiles",
				group = "Number",
				action = "Telescope dotfiles",
				key = "d",
			},
		},
	},
})
-- stylua: ignore end
