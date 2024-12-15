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

require "my_plugins"
