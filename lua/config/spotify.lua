vim.api.nvim_set_keymap("n", "<space>sn", ":AsyncRun spotify-cli next<cr>", { noremap=true, slient=true })
vim.api.nvim_set_keymap("n", "<space>sp", ":AsyncRun spotify-cli prev<cr>", { noremap=true, slient=true })
vim.api.nvim_set_keymap("n", "<space>s<space>", ":AsyncRun spotify-cli toggle<cr>", { noremap=true, slient=true })
