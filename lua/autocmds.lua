vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.vim", "*.lua" },
	group = vim.api.nvim_create_augroup("SourceLuaVimscript", { clear = true }),
	callback = function(tbl)
		vim.keymap.set(Keys.N, "<LEADER>sf", function()
			vim.cmd.source({ args = { vim.fn.expand("%") } })
			print("Sourced file '" .. vim.fn.expand("%") .. "'")
		end, { noremap = true, silent = true, buffer = tbl.buf })
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = {
		"*/dotfiles/tmux-config/**",
	},
	group = vim.api.nvim_create_augroup("SourceTmux", { clear = true }),
	callback = function(tbl)
		vim.keymap.set(Keys.N, "<LEADER>sf", function()
			vim.fn.jobstart({ "tmux", "source", vim.fn.expand("%") })
			print("Sourced file '" .. vim.fn.expand("%") .. "'")
		end, { noremap = true, silent = true, buffer = tbl.buf })
	end,
})

vim.api.nvim_create_autocmd({
	"BufWritePre",
}, {
	pattern = "*",
	callback = function()
		vim.fn.mkdir(vim.fn.expand("<afile>:p:h"), "p")
	end,
})

vim.api.nvim_create_autocmd({
	"BufEnter",
	"FocusGained",
	"InsertLeave",
	"WinEnter",
}, {
	pattern = "*",
	callback = function()
		if vim.opt.nu and vim.fn.mode() ~= "i" then
			vim.opt.rnu = true
		end
	end,
})

vim.api.nvim_create_autocmd({
	"BufLeave",
	"FocusLost",
	"InsertEnter",
	"WinLeave",
}, {
	pattern = "*",
	callback = function()
		if vim.opt.nu then
			vim.opt.rnu = false
		end
	end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ on_visual = false })
	end,
})
