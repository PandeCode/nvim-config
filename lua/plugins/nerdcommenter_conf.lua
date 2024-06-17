-- Create default mappings
vim.g.NERDCreateDefaultMappings = 0

-- Add spaces after comment delimiters by default
vim.g.NERDSpaceDelims = 1

-- Use compact syntax for prettified multi-line comments
vim.g.NERDCompactSexyComs = 1

-- Align line-wise comment delimiters flush left instead of following code indentation
vim.g.NERDDefaultAlign = "left"

-- Add your own custom formats or override the defaults
vim.g.NERDCustomDelimiters = { c = { left = "/**", right = "*/" }, kdl = { left = "//" }}

-- Allow commenting and inverting empty lines (useful when commenting a region)
vim.g.NERDCommentEmptyLines = 1

-- Enable trimming of trailing whitespace when uncommenting
vim.g.NERDTrimTrailingWhitespace = 1

-- Enable NERDCommenterToggle to check all selected lines is commented or not
vim.g.NERDToggleCheckAllLines = 1

vim.api.nvim_set_keymap(Keys.I, "<c-_>",           "<ESC>:call nerdcommenter#Comment('n', 'toggle')<CR>i", Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N, "<c-_>",           ":call nerdcommenter#Comment('',       'toggle')<CR>",  Keys.Noremap)
vim.api.nvim_set_keymap(Keys.V, "<c-_>",           ":call nerdcommenter#Comment('x',      'toggle')<CR>v", Keys.Noremap)
vim.api.nvim_set_keymap(Keys.I, "<space>c<space>", "<ESC>:call nerdcommenter#Comment('n', 'toggle')<CR>i", Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N, "<space>c<space>", ":call nerdcommenter#Comment('',       'toggle')<CR>",  Keys.Noremap)
vim.api.nvim_set_keymap(Keys.V, "<space>c<space>", ":call nerdcommenter#Comment('x',      'toggle')<CR>v", Keys.Noremap)
