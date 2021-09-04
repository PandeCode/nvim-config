vim.api.nvim_set_keymap(
	"n", "<Space>ld<Space>", ":Luadev<CR>", {expr = true, noremap = false}
)
vim.api.nvim_set_keymap(
	"n", "<Space>ldl", "<Plug>(Luadev-RunLine)", {expr = true, noremap = true}
)
vim.api.nvim_set_keymap(
	"n", "<Space>ldl", "<Plug>(Luadev-RunLine)", {expr = true, noremap = true}
)
vim.api.nvim_set_keymap(
	"n", "<Space>ldr", "<Plug>(Luadev-Run)", {expr = true, noremap = true}
)
vim.api.nvim_set_keymap(
	"n", "<Space>ldw", "<Plug>(Luadev-RunWord)", {expr = true, noremap = true}
)
vim.api.nvim_set_keymap(
	"n", "<Space>ldc", "<Plug>(Luadev-Complete)", {expr = true, noremap = true}
)
