vim.cmd [[
if argc() > 1
	silent blast " load last buffer
	silent bfirst " switch back to the first
endif

if exists('+termguicolors')
	let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

syntax sync minlines=256
]]

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
		vim.fn.mkdir(vim.fn.expand "<afile>:p:h", "p")
	end,
})

local function set_filetype(pattern, filetype)
	vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
		pattern = pattern,
		callback = function()
			vim.o.filetype = filetype
		end,
	})
end

set_filetype("*/xmobarrc", "haskell")
set_filetype({ "*.ls", "*.v" }, "vlang")
set_filetype("*.yuck", "yuck")
set_filetype("*.keys", "keys")
set_filetype({ "*.shader", "*.frag", "*.vert" }, "glsl")
set_filetype({ "*.json", "*/waybar/config" }, "jsonc")
set_filetype("*/hypr/**/*.conf", "hypr")
set_filetype("*/sway/*.conf", "swayconfig")
