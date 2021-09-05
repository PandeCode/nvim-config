local noremap = {noremap = true}

vim.api.nvim_set_keymap("n", "<c-t>", ":FloatermNew<CR>", noremap)
vim.api.nvim_set_keymap("i", "<c-t>", "<ESC>:FloatermNew<CR>", noremap)
