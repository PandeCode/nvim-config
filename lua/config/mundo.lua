vim.g.mundo_width              = 45
vim.g.mundo_preview_height     = 15
vim.g.mundo_preview_bottom     = 0
vim.g.mundo_right              = 0 -- (off, open on the left side)
vim.g.mundo_help               = 0 -- (non-expanded help)
vim.g.mundo_disable            = 0 -- (Mundo is enabled as usual)
vim.g.mundo_map_move_older     = "j"
vim.g.mundo_map_move_newer     = "k"
vim.g.mundo_close_on_revert    = 0 -- (windows do not automatically close)
vim.g.mundo_tree_statusline    = nil -- (windows use the default statusline)
vim.g.mundo_preview_statusline = nil -- (windows use the default statusline)
vim.g.mundo_auto_preview       = 1 -- (auto preview diff)
vim.g.mundo_playback_delay     = 60

vim.api.nvim_set_keymap("n", "<C-u>", "<CMD>MundoToggle<CR>", {noremap = true})
