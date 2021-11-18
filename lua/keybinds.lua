vim.g.mapleader = " "

-- stylua: ignore start

vim.api.nvim_set_keymap(Keys.NoneStr, "<c-i>",     "<c-a>",                                                       Keys.Noremap) -- increament
vim.api.nvim_set_keymap(Keys.NoneStr, "<c-d>",     "<c-x>",                                                       Keys.Noremap) -- decreament

vim.api.nvim_set_keymap(Keys.N,       "L",         "$",                                                            Keys.None)
vim.api.nvim_set_keymap(Keys.N,       "H",         "^",                                                            Keys.None)
vim.api.nvim_set_keymap(Keys.N,       "Q",         "",                                                            Keys.None) -- Disable visual mode

vim.api.nvim_set_keymap(Keys.NoneStr, "<SPACE>fe", "<CMD>edit<CR>",                                               Keys.Noremap)

vim.api.nvim_set_keymap(Keys.N,       "<Home>",    "(col('.') == matchend(getline('.'), '^\\s*')+1 ? '0' : '^')", Keys.NoremapExpr)
vim.api.nvim_set_keymap(Keys.N,       "<End>",     "(col('.') == match(getline('.'), '\\s*$') ? '$' : 'g_')",     Keys.NoremapExpr)
vim.api.nvim_set_keymap(Keys.V,       "<End>",     "(col('.') == match(getline('.'), '\\s*$') ? '$h' : 'g_')",    Keys.NoremapExpr)
vim.api.nvim_set_keymap(Keys.I,       "<Home>",    "<C-o><Home>",                                                 Keys.None)
vim.api.nvim_set_keymap(Keys.I,       "<End> ",    "<C-o><End>",                                                  Keys.None)

vim.api.nvim_set_keymap(Keys.N,       "gg",        "gg0",                                                         Keys.Noremap)
vim.api.nvim_set_keymap(Keys.NoneStr, "G",         "G<End>",                                                      Keys.Noremap)
vim.api.nvim_set_keymap(Keys.NoneStr, "Y",         "y$",                                                          Keys.Noremap)

vim.api.nvim_set_keymap(Keys.N,       "<LEADER>w", "<c-w>",                                                       Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N,       "<LEADER>w|", "<CMD>vsplit<CR>",                                            Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N,       "<LEADER>w_", "<CMD>split<CR>",                                             Keys.Noremap)

-- system clipboard
vim.api.nvim_set_keymap(Keys.N,       "<c-c>",     "\"+y\"",                                                      Keys.Noremap)
vim.api.nvim_set_keymap(Keys.V,       "<c-c>",     "\"+y\"",                                                      Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N,       "<c-v>",     "\"+p\"",                                                      Keys.Noremap)
vim.api.nvim_set_keymap(Keys.I,       "<c-v>",     "<c-r>+",                                                      Keys.Noremap)
vim.api.nvim_set_keymap(Keys.C,       "<c-v>",     "<c-r>+",                                                      Keys.Noremap)

vim.api.nvim_set_keymap(Keys.N,       "<c-x>",     "<c-c>d",                                                      Keys.None)
vim.api.nvim_set_keymap(Keys.I,       "<c-x>",     "<c-c>d",                                                      Keys.None)
vim.api.nvim_set_keymap(Keys.C,       "<c-x>",     "<c-c>d",                                                      Keys.None)

-- use <c-r> to insert original character without triggering things like auto-pairs
vim.api.nvim_set_keymap(Keys.I,       "<c-r>",     "<c-v>",                                                       Keys.Noremap)

vim.api.nvim_set_keymap(Keys.N,       "<space>fs", ":noautocmd w<CR>",                                            Keys.Noremap)

vim.api.nvim_set_keymap(Keys.N,       "<F1>",      "<esc>",                                                       Keys.Noremap)
vim.api.nvim_set_keymap(Keys.I,       "<F1>",      "<esc>",                                                       Keys.Noremap)

vim.api.nvim_set_keymap(Keys.N,       Keys.N,      "nzzzv",                                                       Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N,       "N",         "Nzzzv",                                                       Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N,       "J",         "mzJ`z",                                                       Keys.Noremap)

vim.api.nvim_set_keymap(Keys.I,       ",",         ",<c-g>u",                                                     Keys.Noremap)
vim.api.nvim_set_keymap(Keys.I,       ".",         ".<c-g>u",                                                     Keys.Noremap)
vim.api.nvim_set_keymap(Keys.I,       "!",         "!<c-g>u",                                                     Keys.Noremap)
vim.api.nvim_set_keymap(Keys.I,       "?",         "?<c-g>u",                                                     Keys.Noremap)
vim.api.nvim_set_keymap(Keys.I,       "[",         "[<c-g>u",                                                     Keys.Noremap)
vim.api.nvim_set_keymap(Keys.I,       "]",         "]<c-g>u",                                                     Keys.Noremap)
vim.api.nvim_set_keymap(Keys.I,       "(",         "(<c-g>u",                                                     Keys.Noremap)
vim.api.nvim_set_keymap(Keys.I,       ")",         ")<c-g>u",                                                     Keys.Noremap)
vim.api.nvim_set_keymap(Keys.I,       "{",         "{<c-g>u",                                                     Keys.Noremap)
vim.api.nvim_set_keymap(Keys.I,       "}",         "}<c-g>u",                                                     Keys.Noremap)
vim.api.nvim_set_keymap(Keys.I,       "\"",        "\"<c-g>u",                                                    Keys.Noremap)

vim.api.nvim_set_keymap(Keys.N,       "k",         "(v:count > 5 ? \"m'\" . v:count : \"\") . 'k'",               Keys.NoremapExpr)
vim.api.nvim_set_keymap(Keys.N,       "j",         "(v:count > 5 ? \"m'\" . v:count : \"\") . 'j'",               Keys.NoremapExpr)

vim.api.nvim_set_keymap(Keys.V,       "<c-j>",     ":m '>+1<CR>gv=gv",                                            Keys.Noremap)
vim.api.nvim_set_keymap(Keys.V,       "<c-k>",     ":m '<-2<CR>gv=gv",                                            Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N,       "<c-j>",     ":m .+1<CR>==",                                                Keys.Noremap)
vim.api.nvim_set_keymap(Keys.I,       "<c-k>",     "<esc>:m .-2<CR>==i",                                          Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N,       "<c-k>",     ":m .-1<CR>==",                                                Keys.Noremap)
vim.api.nvim_set_keymap(Keys.I,       "<c-j>",     "<esc>:m .+1<CR>==i",                                          Keys.Noremap)

-- Add space bellow or above without leaving normal mode
vim.api.nvim_set_keymap(Keys.N,       "[<space>",  ":<c-u>put!=repeat([''],v:count)<bar>']+1<cr>",                Keys.NoremapSilent)
vim.api.nvim_set_keymap(Keys.N,       "]<space>",  ":<c-u>put =repeat([''],v:count)<bar>'[-1<cr>",                Keys.NoremapSilent)

-- Use simple ; instead of shift + :
vim.api.nvim_set_keymap(Keys.N,       ";",         ":",                                                           Keys.Noremap)
vim.api.nvim_set_keymap(Keys.V,       ";",         ":",                                                           Keys.Noremap)

-- Use this instead of touching Esc key
vim.api.nvim_set_keymap(Keys.I,       "kj",        "<Esc>",                                                       Keys.Noremap)
vim.api.nvim_set_keymap(Keys.I,       "jk",        "<Esc>",                                                       Keys.Noremap)

-- Better tabbing
vim.api.nvim_set_keymap(Keys.N,       "<",         "v<gv<esc>",                                                   Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N,       ">",         "v>gv<esc>",                                                   Keys.Noremap)
vim.api.nvim_set_keymap(Keys.V,       "<",         "<gv",                                                         Keys.Noremap)
vim.api.nvim_set_keymap(Keys.V,       ">",         ">gv",                                                         Keys.Noremap)

vim.api.nvim_set_keymap(Keys.V,       "`",         "<esc>`>a`<esc>`<i`<esc>",                                     Keys.Noremap)

vim.api.nvim_set_keymap(Keys.V,       "(",         "<esc>`>a)<esc>`<i(<esc>",                                     Keys.Noremap)
vim.api.nvim_set_keymap(Keys.V,       "'",         "<esc>`>a'<esc>`<i'<esc>",                                     Keys.Noremap)
vim.api.nvim_set_keymap(Keys.V,       "<c-{>",     "<esc>`>a}<esc>`<i{<esc>",                                     Keys.Noremap)

vim.api.nvim_set_keymap(Keys.V,       ")",         "<esc>`>a)<esc>`<i(<esc>",                                     Keys.Noremap)
vim.api.nvim_set_keymap(Keys.V,       "]",         "<esc>`>a]<esc>`<i[<esc>",                                     Keys.Noremap)
vim.api.nvim_set_keymap(Keys.V,       "<c-}>",     "<esc>`>a}<esc>`<i{<esc>",                                     Keys.Noremap)

vim.api.nvim_set_keymap(Keys.N,       "<space>ne", ":set noexpandtab!<cr>",                                       Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N,       "<space>et", ":set expandtab!<cr>",                                         Keys.Noremap)

vim.api.nvim_set_keymap(Keys.N,       "<space>sf", ":source %<cr>",                                               Keys.Noremap)
-- stylua: ignore end

if LIB_MODAL then
	vim.api.nvim_set_keymap(Keys.N, "<leader>wm", ":lua CallWinMoveMode()<cr>", Keys.Noremap)
	vim.api.nvim_set_keymap(Keys.N, "<leader>wr", ":lua CallWinResizeMode()<cr>", Keys.Noremap)
end
