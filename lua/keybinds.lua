-- vim.cmd "source $HOME/.config/nvim/vimscript/keybinds.vim"
vim.api.nvim_set_keymap("", "<C-i>", "<C-a>", {noremap = true})

vim.api.nvim_set_keymap("n", "<c-t>", ":FloatermNew<CR>", {noremap = true})
vim.api.nvim_set_keymap("i", "<c-t>", "<ESC>:FloatermNew<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<space>wq", ":noautocmd wq<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<LEADER>w", "<c-w>", {noremap = true})

-- Save on Ctrl-S
vim.api.nvim_set_keymap("n", "<c-s>", ":w<CR>", {noremap = true})
vim.api.nvim_set_keymap("i", "<c-s>", "<Esc>:w<CR>a", {noremap = true})
-- system clipboard
vim.api.nvim_set_keymap("n", "<c-c>", "\"+y\"", {noremap = true})
vim.api.nvim_set_keymap("v", "<c-c>", "\"+y\"", {noremap = true})
vim.api.nvim_set_keymap("n", "<c-v>", "\"+p\"", {noremap = true})
vim.api.nvim_set_keymap("i", "<c-v>", "<c-r>+", {noremap = true})
vim.api.nvim_set_keymap("c", "<c-v>", "<c-r>+", {noremap = true})
-- use <c-r> to insert original character without triggering things like auto-pairs
vim.api.nvim_set_keymap("i", "<c-r>", "<c-v>", {noremap = true})

-- Move down
vim.api.nvim_set_keymap("n", "<A-down>", "ddp<CR>", {noremap = true})
vim.api.nvim_set_keymap("i", "<A-down>", "<ESC>ddp <CR>a", {noremap = true})
-- Move up
vim.api.nvim_set_keymap("n", "<A-up>", "ddkkpk <CR>", {noremap = true})
vim.api.nvim_set_keymap("i", "<A-up>", "<ESC>ddkkpk <CR>a", {noremap = true})

vim.api.nvim_set_keymap("n", "<space>fs",  ":noautocmd w<CR>", {noremap = true})

vim.api.nvim_set_keymap("n", "<F1>", "<esc>", {noremap = true})
vim.api.nvim_set_keymap("i", "<F1>", "<esc>", {noremap = true})

vim.api.nvim_set_keymap("n", "a", "<Plug>(EasyAlign)", {noremap = true})
vim.api.nvim_set_keymap("x", "a", "<Plug>(EasyAlign)", {noremap = true})

vim.api.nvim_set_keymap(
	"n", "<Home>", " (col('.') == matchend(getline('.'), '^\\s*')+1 ? '0' : '^')",
	{noremap = true, expr = true}
)
vim.api.nvim_set_keymap(
	"n", "<End>", "(col('.') == match(getline('.'), '\\s*$') ? '$' : 'g_')",
	{noremap = true, expr = true}
)
vim.api.nvim_set_keymap(
	"v", "<End>", "(col('.') == match(getline('.'), '\\s*$') ? '$h' : 'g_')",
	{noremap = true, expr = true}
)
vim.api.nvim_set_keymap("i", "<Home>", "<C-o><Home>", {noremap = false})
vim.api.nvim_set_keymap("i", "<End> ", "<C-o><End>", {noremap = false})

vim.api.nvim_set_keymap("", "Q", ":echo<CR>", {noremap = true})

vim.api.nvim_set_keymap("n", "Y", "y$", {noremap = true})

vim.api.nvim_set_keymap("n", "n", "nzzzv", {noremap = true})
vim.api.nvim_set_keymap("n", "N", "Nzzzv", {noremap = true})
vim.api.nvim_set_keymap("n", "J", "mzJ`z", {noremap = true})

vim.api.nvim_set_keymap("i", ",", ",<c-g>u", {noremap = true})
vim.api.nvim_set_keymap("i", ".", ".<c-g>u", {noremap = true})
vim.api.nvim_set_keymap("i", "!", "!<c-g>u", {noremap = true})
vim.api.nvim_set_keymap("i", "?", "?<c-g>u", {noremap = true})
vim.api.nvim_set_keymap("i", "[", "[<c-g>u", {noremap = true})
vim.api.nvim_set_keymap("i", "]", "]<c-g>u", {noremap = true})
vim.api.nvim_set_keymap("i", "(", "(<c-g>u", {noremap = true})
vim.api.nvim_set_keymap("i", ")", ")<c-g>u", {noremap = true})
vim.api.nvim_set_keymap("i", "{", "{<c-g>u", {noremap = true})
vim.api.nvim_set_keymap("i", "}", "}<c-g>u", {noremap = true})
vim.api.nvim_set_keymap("i", "\"", "\"<c-g>u", {noremap = true})

vim.api.nvim_set_keymap(
	"n", "k", "(v:count > 5 ? \"m'\" . v:count : \"\") . 'k'",
	{noremap = true, expr = true}
)
vim.api.nvim_set_keymap(
	"n", "j", "(v:count > 5 ? \"m'\" . v:count : \"\") . 'j'",
	{noremap = true, expr = true}
)

vim.api.nvim_set_keymap("v", "<c-j>", ":m '>+1<CR>gv=gv", {noremap = true})
vim.api.nvim_set_keymap("v", "<c-k>", ":m '<-2<CR>gv=gv", {noremap = true})
vim.api.nvim_set_keymap("n", "<c-j>", ":m .+1<CR>==", {noremap = true})
vim.api.nvim_set_keymap("i", "<c-k>", "<esc>:m .-2<CR>==i", {noremap = true})
vim.api.nvim_set_keymap("n", "<c-k>", ":m .-2<CR>==", {noremap = true})
vim.api.nvim_set_keymap("i", "<c-j>", "<esc>:m .+1<CR>==i", {noremap = true})

-- Add space bellow or above without leaving normal mode
vim.api.nvim_set_keymap(
	"n", "[<space>", ":<c-u>put!=repeat([''],v:count)<bar>']+1<cr>",
	{noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
	"n", "]<space>", ":<c-u>put =repeat([''],v:count)<bar>'[-1<cr>",
	{noremap = true, silent = true}
)

-- Use simple ; instead of shift + :
vim.api.nvim_set_keymap("n", ";", ":", {noremap = true})
vim.api.nvim_set_keymap("v", ";", ":", {noremap = true})

-- Use this instead of touching Esc key
vim.api.nvim_set_keymap("i", "k", "<Esc>", {noremap = true})
vim.api.nvim_set_keymap("i", "j", "<Esc>", {noremap = true})

-- Better tabbing
vim.api.nvim_set_keymap("n", "<", "v<gv<esc>", {noremap = true})
vim.api.nvim_set_keymap("n", ">", "v>gv<esc>", {noremap = true})
vim.api.nvim_set_keymap("v", "<", "<gv", {noremap = true})
vim.api.nvim_set_keymap("v", ">", ">gv", {noremap = true})

vim.api.nvim_set_keymap("v", "\"", "<esc>`>a'<esc>`<i'<esc>", {noremap = true})
vim.api.nvim_set_keymap("v", "`", "<esc>`>a`<esc>`<i`<esc>", {noremap = true})

vim.api.nvim_set_keymap("v", "(", "<esc>`>a)<esc>`<i(<esc>", {noremap = true})
vim.api.nvim_set_keymap("v", "'", "<esc>`>a]<esc>`<i[<esc>", {noremap = true})
vim.api.nvim_set_keymap(
	"v", "<c-{>", "<esc>`>a}<esc>`<i{<esc>", {noremap = true}
)

vim.api.nvim_set_keymap("v", ")", "<esc>`>a)<esc>`<i(<esc>", {noremap = true})
vim.api.nvim_set_keymap("v", "]", "<esc>`>a]<esc>`<i[<esc>", {noremap = true})
vim.api.nvim_set_keymap(
	"v", "<c-}>", "<esc>`>a}<esc>`<i{<esc>", {noremap = true}
)

vim.api.nvim_set_keymap(
	"n", "<space>ne", ":set noexpandtab!<cr>", {noremap = true}
)

vim.api.nvim_set_keymap("", ",", "@a", {noremap = true})
