vim.cmd "source $HOME/.config/nvim/vimscript/config/neoformat.vim"

--  Enable alignment
vim.g.neoformat_basic_format_align = 1

--" Enable tab to spaces conversion
vim.g.neoformat_basic_format_retab = 0

--" Enable trimmming of trailing whitespace
vim.g.neoformat_basic_format_trim = 1

vim.g.neoformat_enabled_json = {"prettier"}
vim.g.neoformat_enabled_python = {"black"}
vim.g.neoformat_cmake_cmakeformat = {args = {}, stdin = 1, exe = "cmake-format"}
vim.g.neoformat_only_msg_on_error = 1
