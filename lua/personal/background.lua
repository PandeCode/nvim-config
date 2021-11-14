-- https://github.com/PandeCode/dotfiles/blob/main/PERSONAL_PATH/randbg
-- https://github.com/PandeCode/dotfiles/blob/main/PERSONAL_PATH/prevbg

vim.api.nvim_set_keymap(Keys.N, "<SPACE>bap", "<CMD>:AsyncRun prevbg<CR>", Keys.NoremapSilent)
vim.api.nvim_set_keymap(Keys.N, "<SPACE>bar", "<CMD>:AsyncRun randbg<CR>", Keys.NoremapSilent)
vim.api.nvim_set_keymap(Keys.N, "<SPACE>ban", "<CMD>:AsyncRun randbg<CR>", Keys.NoremapSilent)
