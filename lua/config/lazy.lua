-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out =
		vim.fn.system { "git", "clone", "--filter=blob:none", "--depth=1", "--branch=stable", lazyrepo, lazypath }
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)
local opts = {
	spec = {
		{ import = "plugins" },
	},
	rocks = { enabled = false },
	install = { colorscheme = { "darkblue" } },
	checker = { enabled = false },
	change_detection = { enabled = false },
	git = { throttle = { enabled = true } },
	ui = { browser = true, border = "rounded" },

	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
}

if vim.env.PRO then
	opts.profiling = {
		loader = false,
		require = false,
	}
end

-- Setup lazy.nvim
require("lazy").setup(opts)
