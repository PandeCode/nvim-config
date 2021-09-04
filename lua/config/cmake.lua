-- Select target for running / debugging.
vim.api.nvim_set_keymap("n", "<Space>ctt",  ":Telescope cmake select_target", {noremap = true})
-- Create new CMake project.
vim.api.nvim_set_keymap("n", "<Space>ctp",  ":Telescope cmake create_project", {noremap = true})
-- Select build type (Release, Debug, etc.).
vim.api.nvim_set_keymap("n", "<Space>ctb",  ":Telescope cmake select_build_type", {noremap = true})

vim.api.nvim_set_keymap("n", "<Space>cg", ":CMake configure<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Space>cb", ":CMake build<cr>",     {noremap = true})
vim.api.nvim_set_keymap("n", "<Space>cc", ":CMake clean<cr>",     {noremap = true})
vim.api.nvim_set_keymap("n", "<Space>cr", ":CMake run<cr>",       {noremap = true})
vim.api.nvim_set_keymap("n", "<Space>cd", ":CMake debug<cr>",     {noremap = true})
