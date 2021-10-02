--  Enable alignment
vim.g.neoformat_basic_format_align = 1

-- " Enable tab to spaces conversion
vim.g.neoformat_basic_format_retab = 0

-- " Enable trimmming of trailing whitespace
vim.g.neoformat_basic_format_trim = 1

vim.g.neoformat_stylua = {
	exe = "stylua",
	stdin = 1,
	args = {
		"--config-file=~/.stylua.toml",
		"--stdin-filepath",
		'"%=p"',
		"--",
		"-",
	},
}

vim.g.neoformat_enabled_lua             = { "stylua" }

vim.g.neoformat_enabled_js              = { "prettier" }

vim.g.neoformat_enabled_json            = vim.g.neoformat_enabled_js
vim.g.neoformat_enabled_ts              = vim.g.neoformat_enabled_js
vim.g.neoformat_enabled_jsx             = vim.g.neoformat_enabled_js
vim.g.neoformat_enabled_tsx             = vim.g.neoformat_enabled_js
vim.g.neoformat_enabled_typescript      = vim.g.neoformat_enabled_js
vim.g.neoformat_enabled_javascript      = vim.g.neoformat_enabled_js
vim.g.neoformat_enabled_typescriptreact = vim.g.neoformat_enabled_js
vim.g.neoformat_enabled_javascriptreact = vim.g.neoformat_enabled_js

vim.g.neoformat_enabled_python          = { "black" }
vim.g.neoformat_cmake_cmakeformat       = { args = {}, stdin = 1, exe = "cmake-format" }
vim.g.neoformat_only_msg_on_error       = 0

vim.api.nvim_set_keymap(Keys.N, "<Space>ff", ":Neoformat<CR>", Keys.Noremap)
vim.api.nvim_set_keymap(Keys.V, "<Space>ff", ":Neoformat<CR>", Keys.Noremap)
