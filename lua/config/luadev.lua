vim.api.nvim_set_keymap(
	Keys.N, "<Space>ld<Space>", ":Luadev<CR>", Keys.Noremap
)
vim.api.nvim_set_keymap(
	Keys.N, "<Space>ldl", "<Plug>(Luadev-RunLine)", Keys.Noremap
)
vim.api.nvim_set_keymap(
	Keys.N, "<Space>ldr", "<Plug>(Luadev-Run)", Keys.Noremap
)
vim.api.nvim_set_keymap(
	Keys.N, "<Space>ldw", "<Plug>(Luadev-RunWord)", Keys.Noremap
)
vim.api.nvim_set_keymap(
	Keys.N, "<Space>ldc", "<Plug>(Luadev-Complete)", Keys.Noremap
)
