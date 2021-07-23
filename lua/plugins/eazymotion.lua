vim.api.nvim_command([[
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

]])