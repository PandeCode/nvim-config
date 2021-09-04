--  Enable alignment
vim.g.neoformat_basic_format_align = 1

-- " Enable tab to spaces conversion
vim.g.neoformat_basic_format_retab = 0

-- " Enable trimmming of trailing whitespace
vim.g.neoformat_basic_format_trim = 1

vim.g.neoformat_lua_luaformat = {
	exe = "lua-format",
args = {"--config", "~/.lua-format"},
	stdin = 1
}

vim.g.neoformat_enabled_lua = {"luaformat"}
vim.g.neoformat_enabled_json = {"prettier"}
vim.g.neoformat_enabled_python = {"black"}
vim.g.neoformat_cmake_cmakeformat = {args = {}, stdin = 1, exe = "cmake-format"}
vim.g.neoformat_only_msg_on_error = 0

vim.api.nvim_set_keymap("n", "<Space>ff", ":Neoformat<CR>",{noremap=true})
