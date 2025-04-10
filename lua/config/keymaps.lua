vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local n = Keys.N
local a = Keys.A
local i = Keys.I
local v = Keys.V
local c = Keys.C
local none = Keys.None
local silent = Keys.Silent
local noremap = Keys.Noremap
local noremap_expr = Keys.Noremap
local noremap_silent = Keys.NoremapSilent

local keymaps = {
	{ n, "<LEADER>yf", "<CMD>!yew-fmt --edition 2018 %<CR>", noremap_silent },

	{ n, "<LEADER>li", "<CMD>LspInfo<CR>", noremap_silent },
	{ n, "<LEADER>lq", "<CMD>LspStop<CR>", noremap_silent },
	{ n, "<LEADER>lr", "<CMD>LspRestart<CR>", noremap_silent },
	{ n, "<LEADER>ls", "<CMD>LspStart<CR>", noremap_silent },

	{ i, "jk", "<ESC>", noremap_silent },

	{ n, "<LEADER>me", vim.cmd.messages },

	-- Buffer
	{ n, "<LEADER>bp", vim.cmd.bp, Keys.NoremapSilent },
	{ n, "<LEADER>bn", vim.cmd.bn, Keys.NoremapSilent },
	{ n, "<LEADER>bd", vim.cmd.bd, Keys.NoremapSilent },
	{ n, "<A-d>", vim.cmd.bd, Keys.NoremapSilent },

	{ n, "<LEADER>c<LEADER>", ":normal gcc<cr>", noremap_silent },
	{ v, "<LEADER>c<LEADER>", "gc", noremap_silent },
	{ v, "<LEADER>so", ":sort<cr>", none },
	{ n, "<LEADER>ne", ":set noexpandtab!<cr>:%s/    /\t/<cr>", noremap_silent },
	{ n, "<LEADER>et", ":set expandtab!<cr>", noremap },
	{ n, "<LEADER>qa", ":noautocmd qall!<cr>", none },
	{ n, "<LEADER>sf", ":w<cr>", none },
	{ n, "<LEADER>fe", ":edit<cr>", silent },
	{ n, "<LEADER>nw", "<CMD>%s/\\s*$--<CR>", none },
	{ n, "<LEADER>`", "<CMD>edit #<CR>", none },
	{ n, "<LEADER>p", '"_dP', none },
	{ n, "<LEADER>gf", ":e <cfile><cr>", none },
	{ n, "<LEADER><F2>", "*:%s--", none },
	{ a, "<A-a>", "<c-a>", noremap }, -- increament
	{ a, "<A-x>", "<c-x>", noremap }, -- decreament
	{ n, "L", "$", none },
	{ n, "H", "^", none },
	{ n, "Q", "", none }, -- Disable visual mode

	{ n, "<Home>", "(col('.') == matchend(getline('.'), '^\\s*')+1 ? '0' : '^')", noremap_expr },
	{ n, "<End>", "(col('.') == match(getline('.'), '\\s*$') ? '$' : 'g_')", noremap_expr },
	{ v, "<End>", "(col('.') == match(getline('.'), '\\s*$') ? '$h' : 'g_')", noremap_expr },

	{ i, "<Home>", "<C-o><Home>", none },
	{ i, "<End> ", "<C-o><End>", none },
	{ n, "gg", "gg0", noremap },
	{ a, "G", "G<End>", noremap },
	{ a, "Y", "y$", noremap },
	{ n, "<LEADER>w", "<c-w>", noremap },
	{ n, "<LEADER>w|", "<CMD>vsplit<CR>", noremap },
	{ n, "<LEADER>w_", "<CMD>split<CR>", noremap },
	-- system clipboard
	{ n, "<c-c>", '"+y"', noremap },
	{ v, "<c-c>", '"+y"', noremap },
	{ n, "<c-v>", '"+p"', noremap },
	{ i, "<c-v>", "<c-r>+", noremap },
	{ c, "<c-v>", "<c-r>+", noremap },
	{ n, "<c-x>", "<c-c>d", none },
	{ i, "<c-x>", "<c-c>d", none },
	{ c, "<c-x>", "<c-c>d", none },
	-- use <c-r> to insert original character without triggering things like auto-pairs
	{ i, "<c-r>", "<c-v>", noremap },
	{ n, "<LEADER>fs", ":w<CR>", noremap },
	{ n, "<LEADER>fq", ":q<CR>", noremap },
	{ n, "n", "nzzzv", noremap },
	{ n, "N", "Nzzzv", noremap },
	{ n, "J", "mzJ`z", noremap },
	{ i, ",", ",<c-g>u", noremap },
	{ i, ".", ".<c-g>u", noremap },
	{ i, "!", "!<c-g>u", noremap },
	{ i, "?", "?<c-g>u", noremap },
	{ i, "[", "[<c-g>u", noremap },
	{ i, "]", "]<c-g>u", noremap },
	{ i, "(", "(<c-g>u", noremap },
	{ i, ")", ")<c-g>u", noremap },
	{ i, "{", "{<c-g>u", noremap },
	{ i, "}", "}<c-g>u", noremap },
	{ i, '"', '"<c-g>u', noremap },

	-- { n, "k", [[(v:count > 5 ? "m'" . v:count : "") . 'k']], noremap_expr },
	-- { n, "j", [[(v:count > 5 ? "m'" . v:count : "") . 'j']], noremap_expr },

	-- Now handled by treewalker.nvim
	-- (v, "<c-j>", ":m '>+1<CR>gv=gv", noremap},
	-- (v, "<c-k>", ":m '<-2<CR>gv=gv", noremap},
	-- (n, "<c-j>", ":m .+1<CR>==", noremap},
	-- (i, "<c-k>", "<ESC>:m .-2<CR>==i", noremap},
	-- (n, "<c-k>", ":m .-1<CR>==", noremap},
	-- (i, "<c-j>", "<ESC>:m .+1<CR>==i", noremap},

	-- Add space bellow or above without leaving normal mode
	{ n, "[<LEADER>", ":<c-u>put!=repeat([''],v:count)<bar>']+1<cr>", noremap_silent },
	{ n, "]<LEADER>", ":<c-u>put =repeat([''],v:count)<bar>'[-1<cr>", noremap_silent },

	{ n, "<", "v<gv<ESC>", noremap },
	{ n, ">", "v>gv<ESC>", noremap },
	{ v, "<", "<gv", noremap },
	{ v, ">", ">gv", noremap },
	{ v, "`", "<ESC>`>a`<ESC>`<i`<ESC>", noremap },
	{ v, "(", "<ESC>`>a)<ESC>`<i(<ESC>", noremap },
	{ v, "'", "<ESC>`>a'<ESC>`<i'<ESC>", noremap },
	{ v, "<c-{>", "<ESC>`>a}<ESC>`<i{<ESC>", noremap },
	{ v, ")", "<ESC>`>a)<ESC>`<i(<ESC>", noremap },
	{ v, "]", "<ESC>`>a]<ESC>`<i[<ESC>", noremap },
	{ v, "<c-}>", "<ESC>`>a}<ESC>`<i{<ESC>", noremap },
}

for _, value in pairs(keymaps) do
	vim.keymap.set(value[1], value[2], value[3], value[4] or Keys.None)
end
