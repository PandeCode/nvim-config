vim.api.nvim_create_user_command("Q", function(opts)
	vim.cmd("quit" .. (opts.bang and "!" or ""))
end, { bang = true, bar = true })

vim.api.nvim_create_user_command("W", function(opts)
	vim.cmd("w" .. (opts.bang and "!" or ""))
end, { bang = true, bar = true })

vim.api.nvim_create_user_command("WQ", function(opts)
	vim.cmd("wq" .. (opts.bang and "!" or ""))
end, { bang = true, bar = true })

vim.api.nvim_create_user_command("Wq", function(opts)
	vim.cmd("wq" .. (opts.bang and "!" or ""))
end, { bang = true, bar = true })

vim.api.nvim_create_user_command("E", function(opts)
	vim.cmd("e " .. opts.args)
end, { nargs = 1, complete = "file" })

vim.opt.number = true
vim.opt.relativenumber = true

vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = "*",
	callback = function()
		vim.opt.relativenumber = false
	end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	callback = function()
		vim.opt.relativenumber = true
	end,
})


-- Make parent folders if they don't exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = "*",
	callback = function()
		vim.fn.mkdir(vim.fn.expand("<afile>:p:h"), "p")
	end,
})

