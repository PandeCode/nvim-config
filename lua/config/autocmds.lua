-- assumes set ignorecase smartcase;
vim.api.nvim_create_autocmd("CmdLineEnter", {
	pattern = { ":" },
	group = vim.api.nvim_create_augroup("dynamic_smartcase", {}),
	callback = function()
		vim.o.smartcase = false
	end,
})

vim.api.nvim_create_autocmd("CmdLineLeave", {
	pattern = { ":" },
	group = vim.api.nvim_create_augroup("dynamic_smartcase", {}),
	callback = function()
		vim.o.smartcase = true
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = "*",
	callback = function()
		vim.fn.mkdir(vim.fn.expand("<afile>:p:h"), "p")
	end,
})

-- Numbers
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
	pattern = "*",
	callback = function()
		if vim.opt.nu and vim.fn.mode() ~= "i" then
			vim.opt.rnu = true
		end
	end,
})
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
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

local function set_filetype(pattern, filetype)
	vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
		pattern = pattern,
		callback = function()
			vim.o.filetype = filetype
		end,
	})
end

local function create_source_binding(pattern, callback, group)
	pattern = pattern or { "*" }
	callback = callback or function() end
	group = group or RandStr(10)

	vim.api.nvim_create_autocmd("BufEnter", {
		pattern = pattern,
		group = vim.api.nvim_create_augroup(group, { clear = true }),
		callback = function(tbl)
			local notify = Prequire("notify")
			vim.keymap.set(Keys.N, "<LEADER>sf", function()
				callback(tbl)
				if notify ~= nil then
					notify(
						"Sourced file '" .. vim.fn.expand("%") .. "'",
						"info",
						{ title = IDE.name .. " : " .. group }
					)
				else
					print("Sourced file '" .. vim.fn.expand("%") .. "'")
				end
			end, { noremap = true, silent = true, buffer = tbl.buf })
		end,
	})
end

set_filetype("*/xmobarrc", "haskell")
set_filetype("*.yuck", "yuck")
set_filetype("*.keys", "keys")
set_filetype("*.shader", "glsl")
set_filetype("*.frag", "glsl")
set_filetype("*.vert", "glsl")
set_filetype("*.json", "jsonc")
set_filetype("*/hypr/**/*.conf", "hypr")
set_filetype("*/sway/*.conf", "swayconfig")

create_source_binding({ "*.vim", "*.lua" }, function()
	vim.cmd.source({ args = { vim.fn.expand("%") } })
end, "SourceVimscriptLua")
create_source_binding({ "*/config/sxhkd/**" }, function()
	vim.fn.jobstart({ "sh", "-c", '"killall -9 sxhkd ; sxhkd -c ' .. vim.fn.expand("%") .. ' & disown"' })
end, "SourceSxhkd")
create_source_binding({ "*/dotfiles/config/xmobar/**" }, function()
	vim.fn.jobstart({ "sh", "-c", '"killall -9 xmobar ; xmobar & disown"' })
end, "SourceXmobar")
create_source_binding({ "*/dotfiles/tmux-config/**" }, function()
	vim.fn.jobstart({ "tmux", "source", vim.fn.expand("%") })
end, "SourceTmux")
create_source_binding({ "*.cpp" }, function()
	vim.cmd("!runcpp " .. vim.fn.expand("%"))
end, "SourceCpp")
