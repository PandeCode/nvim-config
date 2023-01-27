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
