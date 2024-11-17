local ident = "<RightMouse>"

local popup = require("plenary.popup").create

local Win_id

function CloseMenu()
	vim.api.nvim_win_close(Win_id, true)
end

function ShowMenu(opts, cb)
	local height = 20
	local width = 30
	local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

	Win_id = popup(opts, {
		title = "MyProjects",
		highlight = "MyProjectWindow",
		line = math.floor(((vim.o.lines - height) / 2) - 1),
		col = math.floor((vim.o.columns - width) / 2),
		minwidth = width,
		minheight = height,
		borderchars = borderchars,
		callback = cb,
	})
	local bufnr = vim.api.nvim_win_get_buf(Win_id)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "<cmd>lua CloseMenu()<CR>", { silent = false })
end

vim.keymap.set(Keys.N, ident, function()
	local opts = {
		{
			"Cut",
			function()
				vim.cmd.normal("x")
			end,
		},
		{
			"Copy",
			function()
				vim.cmd.normal("y")
			end,
		},
		{
			"Paste",
			function()
				vim.cmd.normal("p")
			end,
		},
	}
	ShowMenu(opts)
end, Keys.None)
