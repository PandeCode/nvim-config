vim.api.nvim_set_keymap("i", "<c-_>", "<ESC>:call NERDComment('n', 'toggle')<CR>i", {noremap=true})
vim.api.nvim_set_keymap("n", "<c-_>", ":call NERDComment('', 'toggle')<CR>",        {noremap=true})
vim.api.nvim_set_keymap("v", "<c-_>", ":call NERDComment('x', 'toggle')<CR>v",      {noremap=true})
