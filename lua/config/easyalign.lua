vim.api.nvim_set_keymap("n", "ga", "<Plug>(LiveEasyAlign)", {})
vim.api.nvim_set_keymap("x", "ga", "<Plug>(LiveEasyAlign)", {})

vim.g.easy_align_delimiters = {
	d = {pattern = " \\ze\\S\\+\\s*[;=]", left_margin = 0, right_margin = 0}
}
