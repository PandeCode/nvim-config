vim.api.nvim_set_keymap(Keys.N, "ga", "<Plug>(LiveEasyAlign)", Keys.None)
vim.api.nvim_set_keymap(Keys.X, "ga", "<Plug>(LiveEasyAlign)", Keys.None)

vim.g.easy_align_delimiters = {
	d = { pattern = " \\ze\\S\\+\\s*[;=]", left_margin = 0, right_margin = 0 },
}
