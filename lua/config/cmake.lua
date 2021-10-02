-- Select target for running / debugging.
vim.api.nvim_set_keymap(Keys.N, "<Space>ctt", ":Telescope cmake select_target", Keys.Noremap)
-- Create new CMake project.
vim.api.nvim_set_keymap(Keys.N, "<Space>ctp", ":Telescope cmake create_project", Keys.Noremap)
-- Select build type (Release, Debug, etc.).
vim.api.nvim_set_keymap(Keys.N, "<Space>ctb", ":Telescope cmake select_build_type", Keys.Noremap)

vim.api.nvim_set_keymap(Keys.N, "<Space>cg", ":CMake configure<cr>", Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N, "<Space>cb", ":CMake build<cr>", Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N, "<Space>cc", ":CMake clean<cr>", Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N, "<Space>cr", ":CMake run<cr>", Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N, "<Space>cd", ":CMake debug<cr>", Keys.Noremap)
