if vim.env.PROF then
	local snacks = vim.fn.stdpath "data" .. "/lazy/snacks.nvim"
	vim.opt.rtp:append(snacks)
	require("snacks.profiler").startup {
		startup = {
			event = "VimEnter", -- stop profiler on this event. Defaults to `VimEnter`
			-- event = "UIEnter",
			-- event = "VeryLazy",
		},
	}
end

vim.loader.enable()

FFI_RUST = require "libffi_rust" -- ffi_rust/src/lib.rs

FFI_RUST.keymaps() -- ffi_rust/src/keymaps.rs
FFI_RUST.options() -- ffi_rust/src/options.rs
FFI_RUST.autocmds() -- ffi_rust/src/autocmds.rs
FFI_RUST.commands() -- ffi_rust/src/commands.rs

require "utils"

require "config.neovide"
require "config.vscode"

require "config.keymaps"
require "config.autocmds"

require "config.lazy"
