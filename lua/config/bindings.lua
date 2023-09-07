vim.g.mapleader = " "
-- stylua: ignore start
local keymaps = {
	{ Keys.N, "<LEADER>sf", vim.cmd.write },

	{ Keys.V, "<LEADER>so", ":sort<cr>" },
	{ Keys.N, "<LEADER>qa", ":noautocmd qall!<cr>" },

	{ Keys.N, "<LEADER>me", vim.cmd.messages },
	{ Keys.N, "<LEADER>fe", vim.cmd.edit },

	{ Keys.N, "<LEADER>x+", function()
		local filename = vim.fn.expand("%")
		vim.fn.jobstart({ "chmod", "+x", filename })
		require("notify")("Given execution rights to '" .. filename .. "'", "info", { title = IDE.name })
	end },

	{ Keys.N, "<LEADER>x-", function()
		local filename = vim.fn.expand("%")
		vim.fn.jobstart({ "chmod", "-x", filename })
		require("notify")("Taken away execution rights from '" .. filename .. "'", "info", { title = IDE.name })
	end },
	-- Buffer
	{ Keys.N, "<LEADER>bp",   vim.cmd.bp },
	{ Keys.N, "<LEADER>bn",   vim.cmd.bn },
	{ Keys.N, "<LEADER>bd",   vim.cmd.bd },
	{ Keys.N, "<A-d>",        vim.cmd.bd,                                                    Keys.Noremap },
	{ Keys.N, "<LEADER>nw",   "<CMD>%s/\\s*$//<CR>" },
	{ Keys.N, "<LEADER>`",    "<CMD>edit #<CR>" },
	{ Keys.N, "<LEADER>p",    "\"_dP" },
	{ Keys.N, "<LEADER>gf",   ":e <cfile><cr>" },
	{ Keys.N, "<LEADER><F2>", "*:%s//" },
	{ Keys.A, "<A-a>",        "<c-a>",                                                       Keys.Noremap }, -- increament
	{ Keys.A, "<A-x>",        "<c-x>",                                                       Keys.Noremap }, -- decreament

	{ Keys.N, "L",            "$" },
	{ Keys.N, "H",            "^" },
	{ Keys.N, "Q",            "" }, -- Disable visual mode

	{ Keys.N, "<Home>",       "(col('.') == matchend(getline('.'), '^\\s*')+1 ? '0' : '^')", Keys.NoremapExpr },
	{ Keys.N, "<End>",        "(col('.') == match(getline('.'), '\\s*$') ? '$' : 'g_')",     Keys.NoremapExpr },
	{ Keys.V, "<End>",        "(col('.') == match(getline('.'), '\\s*$') ? '$h' : 'g_')",    Keys.NoremapExpr },
	{ Keys.I, "<Home>",       "<C-o><Home>" },
	{ Keys.I, "<End> ",       "<C-o><End>" },
	{ Keys.N, "gg",           "gg0",                                                         Keys.Noremap },
	{ Keys.A, "G",            "G<End>",                                                      Keys.Noremap },
	{ Keys.A, "Y",            "y$",                                                          Keys.Noremap },
	{ Keys.N, "<LEADER>w",    "<c-w>",                                                       Keys.Noremap },
	{ Keys.N, "<LEADER>w|",   "<CMD>vsplit<CR>",                                             Keys.Noremap },
	{ Keys.N, "<LEADER>w_",   "<CMD>split<CR>",                                              Keys.Noremap },

	-- system clipboard
	{ Keys.N, "<c-c>",        "\"+y\"",                                                      Keys.Noremap },
	{ Keys.V, "<c-c>",        "\"+y\"",                                                      Keys.Noremap },
	{ Keys.N, "<c-v>",        "\"+p\"",                                                      Keys.Noremap },
	{ Keys.I, "<c-v>",        "<c-r>+",                                                      Keys.Noremap },
	{ Keys.C, "<c-v>",        "<c-r>+",                                                      Keys.Noremap },
	{ Keys.N, "<c-x>",        "<c-c>d" },
	{ Keys.I, "<c-x>",        "<c-c>d" },
	{ Keys.C, "<c-x>",        "<c-c>d" },

	-- use <c-r> to insert original character without triggering things like auto-pairs
	{ Keys.I, "<c-r>",        "<c-v>",                                                       Keys.Noremap },
	{ Keys.N, "<LEADER>fs",   ":w<CR>",                                                      Keys.Noremap },
	{ Keys.N, "<F1>",         "<esc>",                                                       Keys.Noremap },
	{ Keys.I, "<F1>",         "<esc>",                                                       Keys.Noremap },
	{ Keys.N, Keys.N,         "nzzzv",                                                       Keys.Noremap },
	{ Keys.N, "N",            "Nzzzv",                                                       Keys.Noremap },
	{ Keys.N, "J",            "mzJ`z",                                                       Keys.Noremap },
	{ Keys.I, ",",            ",<c-g>u",                                                     Keys.Noremap },
	{ Keys.I, ".",            ".<c-g>u",                                                     Keys.Noremap },
	{ Keys.I, "!",            "!<c-g>u",                                                     Keys.Noremap },
	{ Keys.I, "?",            "?<c-g>u",                                                     Keys.Noremap },
	{ Keys.I, "[",            "[<c-g>u",                                                     Keys.Noremap },
	{ Keys.I, "]",            "]<c-g>u",                                                     Keys.Noremap },
	{ Keys.I, "(",            "(<c-g>u",                                                     Keys.Noremap },
	{ Keys.I, ")",            ")<c-g>u",                                                     Keys.Noremap },
	{ Keys.I, "{",            "{<c-g>u",                                                     Keys.Noremap },
	{ Keys.I, "}",            "}<c-g>u",                                                     Keys.Noremap },
	{ Keys.I, "\"",           "\"<c-g>u",                                                    Keys.Noremap },
	{ Keys.N, "k",            "(v:count > 5 ? \"m'\" . v:count : \"\") . 'k'",               Keys.NoremapExpr },
	{ Keys.N, "j",            "(v:count > 5 ? \"m'\" . v:count : \"\") . 'j'",               Keys.NoremapExpr },
	{ Keys.V, "<c-j>",        ":m '>+1<CR>gv=gv",                                            Keys.Noremap },
	{ Keys.V, "<c-k>",        ":m '<-2<CR>gv=gv",                                            Keys.Noremap },
	{ Keys.N, "<c-j>",        ":m .+1<CR>==",                                                Keys.Noremap },
	{ Keys.I, "<c-k>",        "<esc>:m .-2<CR>==i",                                          Keys.Noremap },
	{ Keys.N, "<c-k>",        ":m .-1<CR>==",                                                Keys.Noremap },
	{ Keys.I, "<c-j>",        "<esc>:m .+1<CR>==i",                                          Keys.Noremap },

	-- Add space bellow or above without leaving normal mode
	{ Keys.N, "[<LEADER>",    ":<c-u>put!=repeat([''],v:count)<bar>']+1<cr>",                Keys.NoremapSilent },
	{ Keys.N, "]<LEADER>",    ":<c-u>put =repeat([''],v:count)<bar>'[-1<cr>",                Keys.NoremapSilent },

	-- Use simple ; instead of shift + :
	-- 	 {Keys.N, ";", ":", Keys.Noremap},
	-- 	 {Keys.V, ";", ":", Keys.Noremap},

	-- Better tabbing
	{ Keys.N, "<",            "v<gv<esc>",                                                   Keys.Noremap },
	{ Keys.N, ">",            "v>gv<esc>",                                                   Keys.Noremap },
	{ Keys.V, "<",            "<gv",                                                         Keys.Noremap },
	{ Keys.V, ">",            ">gv",                                                         Keys.Noremap },
	{ Keys.V, "`",            "<esc>`>a`<esc>`<i`<esc>",                                     Keys.Noremap },
	{ Keys.V, "(",            "<esc>`>a)<esc>`<i(<esc>",                                     Keys.Noremap },
	{ Keys.V, "'",            "<esc>`>a'<esc>`<i'<esc>",                                     Keys.Noremap },
	{ Keys.V, "<c-{>",        "<esc>`>a}<esc>`<i{<esc>",                                     Keys.Noremap },
	{ Keys.V, ")",            "<esc>`>a)<esc>`<i(<esc>",                                     Keys.Noremap },
	{ Keys.V, "]",            "<esc>`>a]<esc>`<i[<esc>",                                     Keys.Noremap },
	{ Keys.V, "<c-}>",        "<esc>`>a}<esc>`<i{<esc>",                                     Keys.Noremap },
	{ Keys.N, "<LEADER>ne",   ":set noexpandtab!<cr>",                                       Keys.Noremap },
	{ Keys.N, "<LEADER>et",   ":set expandtab!<cr>",                                         Keys.Noremap },

}

for _, value in pairs(keymaps) do
	vim.keymap.set(value[1], value[2], value[3], value[4] or Keys.None)
end
