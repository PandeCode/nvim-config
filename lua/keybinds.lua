vim.g.mapleader = " "
local set_keymap = vim.api.nvim_set_keymap

-- stylua: ignore start

set_keymap(Keys.N,       "<LEADER>p",     "\"_dP",                                   Keys.Noremap)

set_keymap(Keys.N,       "<LEADER>gf",     ":e <cfile><cr>",                                   Keys.Noremap)
set_keymap(Keys.N,       "<LEADER><F2>",     "*:%s//",                                      Keys.Noremap)

set_keymap(Keys.NoneStr, "<c-i>",     "<c-a>",                                                       Keys.Noremap) -- increament
set_keymap(Keys.NoneStr, "<c-d>",     "<c-x>",                                                       Keys.Noremap) -- decreament

set_keymap(Keys.N,       "L",         "$",                                                            Keys.None)
set_keymap(Keys.N,       "H",         "^",                                                            Keys.None)
set_keymap(Keys.N,       "Q",         "",                                                            Keys.None) -- Disable visual mode

set_keymap(Keys.NoneStr, "<LEADER>fe", "<CMD>edit<CR>",                                               Keys.Noremap)

set_keymap(Keys.N,       "<Home>",    "(col('.') == matchend(getline('.'), '^\\s*')+1 ? '0' : '^')", Keys.NoremapExpr)
set_keymap(Keys.N,       "<End>",     "(col('.') == match(getline('.'), '\\s*$') ? '$' : 'g_')",     Keys.NoremapExpr)
set_keymap(Keys.V,       "<End>",     "(col('.') == match(getline('.'), '\\s*$') ? '$h' : 'g_')",    Keys.NoremapExpr)
set_keymap(Keys.I,       "<Home>",    "<C-o><Home>",                                                 Keys.None)
set_keymap(Keys.I,       "<End> ",    "<C-o><End>",                                                  Keys.None)

set_keymap(Keys.N,       "gg",        "gg0",                                                         Keys.Noremap)
set_keymap(Keys.NoneStr, "G",         "G<End>",                                                      Keys.Noremap)
set_keymap(Keys.NoneStr, "Y",         "y$",                                                          Keys.Noremap)

set_keymap(Keys.N,       "<LEADER>w", "<c-w>",                                                       Keys.Noremap)
set_keymap(Keys.N,       "<LEADER>w|", "<CMD>vsplit<CR>",                                            Keys.Noremap)
set_keymap(Keys.N,       "<LEADER>w_", "<CMD>split<CR>",                                             Keys.Noremap)

-- system clipboard
set_keymap(Keys.N,       "<c-c>",     "\"+y\"",                                                      Keys.Noremap)
set_keymap(Keys.V,       "<c-c>",     "\"+y\"",                                                      Keys.Noremap)
set_keymap(Keys.N,       "<c-v>",     "\"+p\"",                                                      Keys.Noremap)
set_keymap(Keys.I,       "<c-v>",     "<c-r>+",                                                      Keys.Noremap)
set_keymap(Keys.C,       "<c-v>",     "<c-r>+",                                                      Keys.Noremap)

set_keymap(Keys.N,       "<c-x>",     "<c-c>d",                                                      Keys.None)
set_keymap(Keys.I,       "<c-x>",     "<c-c>d",                                                      Keys.None)
set_keymap(Keys.C,       "<c-x>",     "<c-c>d",                                                      Keys.None)

-- use <c-r> to insert original character without triggering things like auto-pairs
set_keymap(Keys.I,       "<c-r>",     "<c-v>",                                                       Keys.Noremap)

set_keymap(Keys.N,       "<LEADER>fs", ":noautocmd w<CR>",                                            Keys.Noremap)

set_keymap(Keys.N,       "<F1>",      "<esc>",                                                       Keys.Noremap)
set_keymap(Keys.I,       "<F1>",      "<esc>",                                                       Keys.Noremap)

set_keymap(Keys.N,       Keys.N,      "nzzzv",                                                       Keys.Noremap)
set_keymap(Keys.N,       "N",         "Nzzzv",                                                       Keys.Noremap)
set_keymap(Keys.N,       "J",         "mzJ`z",                                                       Keys.Noremap)

set_keymap(Keys.I,       ",",         ",<c-g>u",                                                     Keys.Noremap)
set_keymap(Keys.I,       ".",         ".<c-g>u",                                                     Keys.Noremap)
set_keymap(Keys.I,       "!",         "!<c-g>u",                                                     Keys.Noremap)
set_keymap(Keys.I,       "?",         "?<c-g>u",                                                     Keys.Noremap)
set_keymap(Keys.I,       "[",         "[<c-g>u",                                                     Keys.Noremap)
set_keymap(Keys.I,       "]",         "]<c-g>u",                                                     Keys.Noremap)
set_keymap(Keys.I,       "(",         "(<c-g>u",                                                     Keys.Noremap)
set_keymap(Keys.I,       ")",         ")<c-g>u",                                                     Keys.Noremap)
set_keymap(Keys.I,       "{",         "{<c-g>u",                                                     Keys.Noremap)
set_keymap(Keys.I,       "}",         "}<c-g>u",                                                     Keys.Noremap)
set_keymap(Keys.I,       "\"",        "\"<c-g>u",                                                    Keys.Noremap)

set_keymap(Keys.N,       "k",         "(v:count > 5 ? \"m'\" . v:count : \"\") . 'k'",               Keys.NoremapExpr)
set_keymap(Keys.N,       "j",         "(v:count > 5 ? \"m'\" . v:count : \"\") . 'j'",               Keys.NoremapExpr)

set_keymap(Keys.V,       "<c-j>",     ":m '>+1<CR>gv=gv",                                            Keys.Noremap)
set_keymap(Keys.V,       "<c-k>",     ":m '<-2<CR>gv=gv",                                            Keys.Noremap)
set_keymap(Keys.N,       "<c-j>",     ":m .+1<CR>==",                                                Keys.Noremap)
set_keymap(Keys.I,       "<c-k>",     "<esc>:m .-2<CR>==i",                                          Keys.Noremap)
set_keymap(Keys.N,       "<c-k>",     ":m .-1<CR>==",                                                Keys.Noremap)
set_keymap(Keys.I,       "<c-j>",     "<esc>:m .+1<CR>==i",                                          Keys.Noremap)

-- Add space bellow or above without leaving normal mode
set_keymap(Keys.N,       "[<LEADER>",  ":<c-u>put!=repeat([''],v:count)<bar>']+1<cr>",                Keys.NoremapSilent)
set_keymap(Keys.N,       "]<LEADER>",  ":<c-u>put =repeat([''],v:count)<bar>'[-1<cr>",                Keys.NoremapSilent)

-- Use simple ; instead of shift + :
set_keymap(Keys.N,       ";",         ":",                                                           Keys.Noremap)
set_keymap(Keys.V,       ";",         ":",                                                           Keys.Noremap)

-- Use this instead of touching Esc key
set_keymap(Keys.I,       "kj",        "<Esc>",                                                       Keys.Noremap)
set_keymap(Keys.I,       "jk",        "<Esc>",                                                       Keys.Noremap)

-- Better tabbing
set_keymap(Keys.N,       "<",         "v<gv<esc>",                                                   Keys.Noremap)
set_keymap(Keys.N,       ">",         "v>gv<esc>",                                                   Keys.Noremap)
set_keymap(Keys.V,       "<",         "<gv",                                                         Keys.Noremap)
set_keymap(Keys.V,       ">",         ">gv",                                                         Keys.Noremap)

set_keymap(Keys.V,       "`",         "<esc>`>a`<esc>`<i`<esc>",                                     Keys.Noremap)

set_keymap(Keys.V,       "(",         "<esc>`>a)<esc>`<i(<esc>",                                     Keys.Noremap)
set_keymap(Keys.V,       "'",         "<esc>`>a'<esc>`<i'<esc>",                                     Keys.Noremap)
set_keymap(Keys.V,       "<c-{>",     "<esc>`>a}<esc>`<i{<esc>",                                     Keys.Noremap)

set_keymap(Keys.V,       ")",         "<esc>`>a)<esc>`<i(<esc>",                                     Keys.Noremap)
set_keymap(Keys.V,       "]",         "<esc>`>a]<esc>`<i[<esc>",                                     Keys.Noremap)
set_keymap(Keys.V,       "<c-}>",     "<esc>`>a}<esc>`<i{<esc>",                                     Keys.Noremap)

set_keymap(Keys.N,       "<LEADER>ne", ":set noexpandtab!<cr>",                                       Keys.Noremap)
set_keymap(Keys.N,       "<LEADER>et", ":set expandtab!<cr>",                                         Keys.Noremap)

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = {"*.vim", "*.lua"},
	group = vim.api.nvim_create_augroup("LuaVimscript", {clear = true}),
	callback = function()
		set_keymap(Keys.N, "<LEADER>sf", ":source %<cr>", Keys.Noremap)
	end,
})

-- stylua: ignore end

if LIB_MODAL then
	set_keymap(Keys.N, "<LEADER>wm", ":lua CallWinMoveMode()<cr>", Keys.Noremap)
	set_keymap(Keys.N, "<LEADER>wr", ":lua CallWinResizeMode()<cr>", Keys.Noremap)
end
