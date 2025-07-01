vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local n = Keys.N
local a = Keys.A
local i = Keys.I
local v = Keys.V
local c = Keys.C
local x = Keys.X
local silent = Keys.Silent
local noremap = Keys.Noremap
local remap = Keys.Remap
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
	{ n, "<LEADER>bp", vim.cmd.bp, noremap_silent },
	{ n, "<LEADER>bn", vim.cmd.bn, noremap_silent },
	{ n, "<A-d>", vim.cmd.bd, noremap_silent },

	{ n, "<LEADER>c<LEADER>", ":normal gcc<cr>", noremap_silent },
	{ v, "<LEADER>c<LEADER>", "gc", noremap_silent },
	{ v, "<LEADER>so", ":sort<cr>" },
	{ n, "<LEADER>ne", ":set noexpandtab!<cr>:%s/    /\t/<cr>", noremap_silent },
	{ n, "<LEADER>et", ":set expandtab!<cr>", noremap },
	{ n, "<LEADER>qa", ":noautocmd qall!<cr>" },
	{ n, "<LEADER>sf", ":w<cr>" },
	{ n, "<LEADER>fe", ":edit<cr>", silent },
	{ n, "<LEADER>nw", "<CMD>%s/\\s*$--<CR>" },
	{ n, "<LEADER>`", "<CMD>edit #<CR>" },
	{ n, "<LEADER>p", '"_dP' },
	{ n, "<LEADER>gf", ":e <cfile><cr>" },
	{ n, "<LEADER><F2>", "*:%s--" },
	{ a, "<A-a>", "<c-a>", noremap }, -- increament
	{ a, "<A-x>", "<c-x>", noremap }, -- decreament
	{ n, "L", "$" },
	{ n, "H", "^" },
	{ n, "Q", "" }, -- Disable visual mode

	{ n, "<Home>", "(col('.') == matchend(getline('.'), '^\\s*')+1 ? '0' : '^')", noremap_expr },
	{ n, "<End>", "(col('.') == match(getline('.'), '\\s*$') ? '$' : 'g_')", noremap_expr },
	{ v, "<End>", "(col('.') == match(getline('.'), '\\s*$') ? '$h' : 'g_')", noremap_expr },

	{ i, "<Home>", "<C-o><Home>" },
	{ i, "<End> ", "<C-o><End>" },
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
	{ n, "<c-x>", "<c-c>d" },
	{ i, "<c-x>", "<c-c>d" },
	{ c, "<c-x>", "<c-c>d" },
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

	-- Add space bellow or above without leaving normal mode
	{ n, "<LEADER>j", ":<c-u>put!=repeat([''],v:count)<bar>']+1<cr>", noremap_silent },
	{ n, "<LEADER>k", ":<c-u>put =repeat([''],v:count)<bar>'[-1<cr>", noremap_silent },

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

	{
		n,
		"j",
		function()
			if vim.v.count > 0 then
				return "m'" .. vim.v.count .. "j"
			end
			return "j"
		end,
		{ expr = true },
	},

	{
		n,
		"k",
		function()
			if vim.v.count > 0 then
				return "m'" .. vim.v.count .. "k"
			end
			return "k"
		end,
		{ expr = true },
	},

	{ x, "/", "<Esc>/\\%V" },

	{ i, "<c-f>", "<c-g>u<Esc>[s1z=gi<c-g>u", noremap },
}

vim.keymap.set("x", "I", function()
	return vim.fn.mode() == "V" and "^<C-v>I" or "I"
end, { expr = true })
vim.keymap.set("x", "A", function()
	return vim.fn.mode() == "V" and "$<C-v>A" or "A"
end, { expr = true })

vim.cmd [[
noremap Y "+y
nnoremap YY "+yy
nnoremap / /\v
vnoremap / /\v

cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
]]

for _, value in pairs(keymaps) do
	vim.keymap.set(value[1], value[2], value[3], value[4] or {})
end
