vim.loader.enable()

FFI_RUST = require "libffi_rust" -- ffi_rust/src/lib.rs

FFI_RUST.keymaps() -- ffi_rust/src/keymaps.rs

require "config.neovide"
require "config.vscode"

require "config.keymaps"
require "config.autocmds"

require "config.lazy"

-- require "config.extras"

vim.keymap.set("n", "<LEADER>sf", ":source %<CR>")

FFI_RUST.options() -- ffi_rust/src/options.rs
FFI_RUST.autocmds() -- ffi_rust/src/autocmds.rs
FFI_RUST.commands() -- ffi_rust/src/commands.rs
