vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>wj", "<C-W>j", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>wh", "<C-W>h", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>wk", "<C-W>k", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>wl", "<C-W>l", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>bn", ":bn<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bp", ":bp<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "gg", "gg0", { noremap = true, silent = true })
vim.keymap.set("n", "G", "G$", { noremap = true, silent = true })
