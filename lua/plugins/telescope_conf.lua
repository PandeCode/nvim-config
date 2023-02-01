local builtin = require("telescope.builtin")

vim.keymap.set(Keys.N, "<LEADER>fb", builtin.buffers, Keys.None)
vim.keymap.set(Keys.N, "<LEADER>ff", builtin.find_files, Keys.None)
vim.keymap.set(Keys.N, "<LEADER>fg", builtin.live_grep, Keys.None)
vim.keymap.set(Keys.N, "<LEADER>fr", builtin.registers, Keys.None)
vim.keymap.set(Keys.N, "<LEADER>fk", builtin.keymaps, Keys.None)
vim.keymap.set(Keys.N, "<LEADER>fh", builtin.help_tags, Keys.None)
vim.keymap.set(Keys.N, "<LEADER>fm", builtin.man_pages, Keys.None)
vim.keymap.set(Keys.N, "<LEADER>f'", builtin.marks, Keys.None)

require("telescope").setup({})
