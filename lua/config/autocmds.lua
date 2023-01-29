-- assumes set ignorecase smartcase;
vim.api.nvim_create_autocmd(
	"CmdLineEnter", {
		pattern = {":"},
		group = vim.api.nvim_create_augroup("dynamic_smartcase", {}),
		callback = function() vim.o.smartcase = false end
	}
)

vim.api.nvim_create_autocmd(
	"CmdLineLeave", {
		pattern = {":"},
		group = vim.api.nvim_create_augroup("dynamic_smartcase", {}),
		callback = function() vim.o.smartcase = true end
	}
)

vim.api.nvim_create_autocmd(
	"BufEnter", {
		pattern = {"*.vim", "*.lua"},
		group = vim.api.nvim_create_augroup("SourceLuaVimscript", {clear = true}),
		callback = function(tbl)
			vim.keymap.set(
				Keys.N, "<LEADER>sf", function()
					vim.cmd.source({args = {vim.fn.expand("%")}})
					local notify = require("notify")
					notify(
						"Sourced file '" .. vim.fn.expand("%") .. "'", "info", {title = IDE.name}
					)
				end, {noremap = true, silent = true, buffer = tbl.buf}
			)
		end
	}
)

vim.api.nvim_create_autocmd(
	"BufEnter", {
		pattern = {"*/dotfiles/config/xmobar/**"},
		group = vim.api.nvim_create_augroup("SourceXmobar", {clear = true}),
		callback = function(tbl)
			vim.keymap.set(
				Keys.N, "<LEADER>sf", function()
					vim.fn.jobstart({"sh", "-c", "\"killall -9 xmobar ; xmobar & disown\""})
					local notify = require("notify")
					notify(
						"Sourced file '" .. vim.fn.expand("%") .. "'", "info", {title = IDE.name}
					)
				end, {noremap = true, silent = true, buffer = tbl.buf}
			)
		end
	}
)

vim.api.nvim_create_autocmd(
	"BufEnter", {
		pattern = {"*/dotfiles/tmux-config/**"},
		group = vim.api.nvim_create_augroup("SourceTmux", {clear = true}),
		callback = function(tbl)
			vim.keymap.set(
				Keys.N, "<LEADER>sf", function()
					vim.fn.jobstart({"tmux", "source", vim.fn.expand("%")})
					local notify = require("notify")
					notify(
						"Sourced file '" .. vim.fn.expand("%") .. "'", "info", {title = IDE.name}
					)
				end, {noremap = true, silent = true, buffer = tbl.buf}
			)
		end
	}
)

vim.api.nvim_create_autocmd(
	{"BufWritePre"}, {
		pattern = "*",
		callback = function() vim.fn.mkdir(vim.fn.expand("<afile>:p:h"), "p") end
	}
)

vim.api.nvim_create_autocmd(
	{"BufEnter", "FocusGained", "InsertLeave", "WinEnter"}, {
		pattern = "*",
		callback = function()
			if vim.opt.nu and vim.fn.mode() ~= "i" then vim.opt.rnu = true end
		end
	}
)

vim.api.nvim_create_autocmd(
	{"BufLeave", "FocusLost", "InsertEnter", "WinLeave"}, {
		pattern = "*",
		callback = function() if vim.opt.nu then vim.opt.rnu = false end end
	}
)

vim.api.nvim_create_autocmd(
	{"TextYankPost"}, {
		pattern = "*",
		callback = function() vim.highlight.on_yank({on_visual = false}) end
	}
)

local function set_filetype(pattern, filetype)
	vim.api.nvim_create_autocmd(
		{"BufNewFile", "BufRead"},
		{pattern = pattern, callback = function() vim.o.filetype = filetype end}
	)
end

set_filetype("*/xmobarrc", "haskell")
set_filetype("*.yuck", "yuck")
set_filetype("*.keys", "keys")
set_filetype("*.shader", "glsl")
set_filetype("*.frag", "glsl")
set_filetype("*.vert", "glsl")
set_filetype("*.json", "jsonc")
set_filetype("*/.config/hypr/**/*.conf", "hypr")
set_filetype("*/.config/sway/**/*.conf", "swayconf")
