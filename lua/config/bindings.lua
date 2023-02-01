vim.g.mapleader = " "
-- stylua: ignore start

vim.keymap.set(Keys.V, "<LEADER>so", ":sort<cr>", Keys.None)
vim.keymap.set(Keys.N, "<LEADER>qa", ":noautocmd qall!<cr>", Keys.None)

vim.keymap.set(Keys.N, "<LEADER>me", ":mes<cr>", Keys.None)
vim.keymap.set(Keys.N, "<LEADER>fe", vim.cmd.edit, Keys.None)

-- Buffer
vim.keymap.set(Keys.N, "<LEADER>bp", vim.cmd.bp, Keys.None)
vim.keymap.set(Keys.N, "<LEADER>bn", vim.cmd.bn, Keys.None)
vim.keymap.set(Keys.N, "<LEADER>bd", vim.cmd.bd, Keys.None)
vim.keymap.set(Keys.N, "<A-d>", vim.cmd.bd, Keys.Noremap)

vim.keymap.set(Keys.N, "<LEADER>nw", "<CMD>%s/\\s*$//<CR>", Keys.None)

vim.keymap.set(Keys.N, "<LEADER>`", "<CMD>edit #<CR>", Keys.None)

vim.keymap.set(Keys.N, "<LEADER>p", "\"_dP", Keys.None)

vim.keymap.set(Keys.N, "<LEADER>gf", ":e <cfile><cr>", Keys.None)

vim.keymap.set(Keys.N, "<LEADER><F2>", "*:%s//", Keys.None)

vim.keymap.set(Keys.NoneStr, "<A-a>", "<c-a>", Keys.Noremap) -- increament
vim.keymap.set(Keys.NoneStr, "<A-x>", "<c-x>", Keys.Noremap) -- decreament

vim.keymap.set(Keys.N, "L", "$", Keys.None)
vim.keymap.set(Keys.N, "H", "^", Keys.None)
vim.keymap.set(Keys.N, "Q", "", Keys.None) -- Disable visual mode

vim.keymap.set(
	Keys.N, "<Home>",
	"(col('.') == matchend(getline('.'), '^\\s*')+1 ? '0' : '^')", Keys.NoremapExpr
)
vim.keymap.set(
	Keys.N, "<End>", "(col('.') == match(getline('.'), '\\s*$') ? '$' : 'g_')",
	Keys.NoremapExpr
)
vim.keymap.set(
	Keys.V, "<End>", "(col('.') == match(getline('.'), '\\s*$') ? '$h' : 'g_')",
	Keys.NoremapExpr
)
vim.keymap.set(Keys.I, "<Home>", "<C-o><Home>", Keys.None)
vim.keymap.set(Keys.I, "<End> ", "<C-o><End>", Keys.None)

vim.keymap.set(Keys.N, "gg", "gg0", Keys.Noremap)
vim.keymap.set(Keys.NoneStr, "G", "G<End>", Keys.Noremap)
vim.keymap.set(Keys.NoneStr, "Y", "y$", Keys.Noremap)

vim.keymap.set(Keys.N, "<LEADER>w", "<c-w>", Keys.Noremap)
vim.keymap.set(Keys.N, "<LEADER>w|", "<CMD>vsplit<CR>", Keys.Noremap)
vim.keymap.set(Keys.N, "<LEADER>w_", "<CMD>split<CR>", Keys.Noremap)

-- system clipboard
vim.keymap.set(Keys.N, "<c-c>", "\"+y\"", Keys.Noremap)
vim.keymap.set(Keys.V, "<c-c>", "\"+y\"", Keys.Noremap)
vim.keymap.set(Keys.N, "<c-v>", "\"+p\"", Keys.Noremap)
vim.keymap.set(Keys.I, "<c-v>", "<c-r>+", Keys.Noremap)
vim.keymap.set(Keys.C, "<c-v>", "<c-r>+", Keys.Noremap)

vim.keymap.set(Keys.N, "<c-x>", "<c-c>d", Keys.None)
vim.keymap.set(Keys.I, "<c-x>", "<c-c>d", Keys.None)
vim.keymap.set(Keys.C, "<c-x>", "<c-c>d", Keys.None)

-- use <c-r> to insert original character without triggering things like auto-pairs
vim.keymap.set(Keys.I, "<c-r>", "<c-v>", Keys.Noremap)

vim.keymap.set(Keys.N, "<LEADER>fs", ":w<CR>", Keys.Noremap)

vim.keymap.set(Keys.N, "<F1>", "<esc>", Keys.Noremap)
vim.keymap.set(Keys.I, "<F1>", "<esc>", Keys.Noremap)

vim.keymap.set(Keys.N, Keys.N, "nzzzv", Keys.Noremap)
vim.keymap.set(Keys.N, "N", "Nzzzv", Keys.Noremap)
vim.keymap.set(Keys.N, "J", "mzJ`z", Keys.Noremap)

vim.keymap.set(Keys.I, ",", ",<c-g>u", Keys.Noremap)
vim.keymap.set(Keys.I, ".", ".<c-g>u", Keys.Noremap)
vim.keymap.set(Keys.I, "!", "!<c-g>u", Keys.Noremap)
vim.keymap.set(Keys.I, "?", "?<c-g>u", Keys.Noremap)
vim.keymap.set(Keys.I, "[", "[<c-g>u", Keys.Noremap)
vim.keymap.set(Keys.I, "]", "]<c-g>u", Keys.Noremap)
vim.keymap.set(Keys.I, "(", "(<c-g>u", Keys.Noremap)
vim.keymap.set(Keys.I, ")", ")<c-g>u", Keys.Noremap)
vim.keymap.set(Keys.I, "{", "{<c-g>u", Keys.Noremap)
vim.keymap.set(Keys.I, "}", "}<c-g>u", Keys.Noremap)
vim.keymap.set(Keys.I, "\"", "\"<c-g>u", Keys.Noremap)

vim.keymap.set(
	Keys.N, "k", "(v:count > 5 ? \"m'\" . v:count : \"\") . 'k'", Keys.NoremapExpr
)
vim.keymap.set(
	Keys.N, "j", "(v:count > 5 ? \"m'\" . v:count : \"\") . 'j'", Keys.NoremapExpr
)

vim.keymap.set(Keys.V, "<c-j>", ":m '>+1<CR>gv=gv", Keys.Noremap)
vim.keymap.set(Keys.V, "<c-k>", ":m '<-2<CR>gv=gv", Keys.Noremap)
vim.keymap.set(Keys.N, "<c-j>", ":m .+1<CR>==", Keys.Noremap)
vim.keymap.set(Keys.I, "<c-k>", "<esc>:m .-2<CR>==i", Keys.Noremap)
vim.keymap.set(Keys.N, "<c-k>", ":m .-1<CR>==", Keys.Noremap)
vim.keymap.set(Keys.I, "<c-j>", "<esc>:m .+1<CR>==i", Keys.Noremap)

-- Add space bellow or above without leaving normal mode
vim.keymap.set(
	Keys.N, "[<LEADER>", ":<c-u>put!=repeat([''],v:count)<bar>']+1<cr>",
	Keys.NoremapSilent
)
vim.keymap.set(
	Keys.N, "]<LEADER>", ":<c-u>put =repeat([''],v:count)<bar>'[-1<cr>",
	Keys.NoremapSilent
)

-- Use simple ; instead of shift + :
vim.keymap.set(Keys.N, ";", ":", Keys.Noremap)
vim.keymap.set(Keys.V, ";", ":", Keys.Noremap)

-- Better tabbing
vim.keymap.set(Keys.N, "<", "v<gv<esc>", Keys.Noremap)
vim.keymap.set(Keys.N, ">", "v>gv<esc>", Keys.Noremap)
vim.keymap.set(Keys.V, "<", "<gv", Keys.Noremap)
vim.keymap.set(Keys.V, ">", ">gv", Keys.Noremap)

vim.keymap.set(Keys.V, "`", "<esc>`>a`<esc>`<i`<esc>", Keys.Noremap)

vim.keymap.set(Keys.V, "(", "<esc>`>a)<esc>`<i(<esc>", Keys.Noremap)
vim.keymap.set(Keys.V, "'", "<esc>`>a'<esc>`<i'<esc>", Keys.Noremap)
vim.keymap.set(Keys.V, "<c-{>", "<esc>`>a}<esc>`<i{<esc>", Keys.Noremap)

vim.keymap.set(Keys.V, ")", "<esc>`>a)<esc>`<i(<esc>", Keys.Noremap)
vim.keymap.set(Keys.V, "]", "<esc>`>a]<esc>`<i[<esc>", Keys.Noremap)
vim.keymap.set(Keys.V, "<c-}>", "<esc>`>a}<esc>`<i{<esc>", Keys.Noremap)

vim.keymap.set(Keys.N, "<LEADER>ne", ":set noexpandtab!<cr>", Keys.Noremap)
vim.keymap.set(Keys.N, "<LEADER>et", ":set expandtab!<cr>", Keys.Noremap)
