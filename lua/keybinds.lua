vim.g.mapleader  = " "

local n             = "n"
local i             = "i"
local v             = "v"
local noremap       = { noremap=true              }
local noremapSilent = { noremap=true, silent=true }
local noremapExpr   = { noremap=true, expr=true   }

vim.api.nvim_set_keymap("",  "<C-d>",     "<C-x>",                                                        noremap)
vim.api.nvim_set_keymap("",  "<C-i>",     "<C-a>",                                                        noremap)
vim.api.nvim_set_keymap("",  ",",         "@a",                                                           noremap)

vim.api.nvim_set_keymap(n,   "<Home>",    " (col('.') == matchend(getline('.'), '^\\s*')+1 ? '0' : '^')", noremapExpr)
vim.api.nvim_set_keymap(n,   "<End>",     "(col('.') == match(getline('.'), '\\s*$') ? '$' : 'g_')",      noremapExpr)
vim.api.nvim_set_keymap(v,   "<End>",     "(col('.') == match(getline('.'), '\\s*$') ? '$h' : 'g_')",     noremapExpr)
vim.api.nvim_set_keymap(i,   "<Home>",    "<C-o><Home>",                                                  {})
vim.api.nvim_set_keymap(i,   "<End> ",    "<C-o><End>",                                                   {})

vim.api.nvim_set_keymap(n,   "H",         "<C-o><Home>",                                                  {})
vim.api.nvim_set_keymap(n,   "L",         "<C-o><End>",                                                   {})
vim.api.nvim_set_keymap(n,   "gg",        "gg0",                                                          noremap)
vim.api.nvim_set_keymap(n,   "G",         "G<End>",                                                       noremap)
vim.api.nvim_set_keymap(n,   "Y",         "y$",                                                           noremap)

vim.api.nvim_set_keymap(n,   "<space>wq", ":noautocmd wq<cr>",                                            noremap)
vim.api.nvim_set_keymap(n,   "<LEADER>w", "<c-w>",                                                        noremap)

-- Save on Ctrl-S
vim.api.nvim_set_keymap(n,   "<c-s>",     ":w<CR>",                                                       noremap)
vim.api.nvim_set_keymap(i,   "<c-s>",     "<Esc>:w<CR>a",                                                 noremap)
-- system clipboard
vim.api.nvim_set_keymap(n,   "<c-c>",     "\"+y\"",                                                       noremap)
vim.api.nvim_set_keymap(v,   "<c-c>",     "\"+y\"",                                                       noremap)
vim.api.nvim_set_keymap(n,   "<c-v>",     "\"+p\"",                                                       noremap)
vim.api.nvim_set_keymap(i,   "<c-v>",     "<c-r>+",                                                       noremap)
vim.api.nvim_set_keymap("c", "<c-v>",     "<c-r>+",                                                       noremap)

-- use <c-r> to insert original character without triggering things like auto-pairs
vim.api.nvim_set_keymap(i,   "<c-r>",     "<c-v>",                                                        noremap)

vim.api.nvim_set_keymap(n,   "<space>fs", ":noautocmd w<CR>",                                             noremap)

vim.api.nvim_set_keymap(n,   "<F1>",      "<esc>",                                                        noremap)
vim.api.nvim_set_keymap(i,   "<F1>",      "<esc>",                                                        noremap)

vim.api.nvim_set_keymap(n,   n,           "nzzzv",                                                        noremap)
vim.api.nvim_set_keymap(n,   "N",           "Nzzzv",                                                        noremap)
vim.api.nvim_set_keymap(n,   "J",         "mzJ`z",                                                        noremap)

vim.api.nvim_set_keymap(i,   ",",         ",<c-g>u",                                                      noremap)
vim.api.nvim_set_keymap(i,   ".",         ".<c-g>u",                                                      noremap)
vim.api.nvim_set_keymap(i,   "!",         "!<c-g>u",                                                      noremap)
vim.api.nvim_set_keymap(i,   "?",         "?<c-g>u",                                                      noremap)
vim.api.nvim_set_keymap(i,   "[",         "[<c-g>u",                                                      noremap)
vim.api.nvim_set_keymap(i,   "]",         "]<c-g>u",                                                      noremap)
vim.api.nvim_set_keymap(i,   "(",         "(<c-g>u",                                                      noremap)
vim.api.nvim_set_keymap(i,   ")",         ")<c-g>u",                                                      noremap)
vim.api.nvim_set_keymap(i,   "{",         "{<c-g>u",                                                      noremap)
vim.api.nvim_set_keymap(i,   "}",         "}<c-g>u",                                                      noremap)
vim.api.nvim_set_keymap(i,   "\"",        "\"<c-g>u",                                                     noremap)

vim.api.nvim_set_keymap(n,  "k",         "(v:count > 5 ? \"m'\" . v:count : \"\") . 'k'",                noremapExpr)
vim.api.nvim_set_keymap(n,  "j",         "(v:count > 5 ? \"m'\" . v:count : \"\") . 'j'",                noremapExpr)

vim.api.nvim_set_keymap(v,   "<c-j>",     ":m '>+1<CR>gv=gv",                                             noremap)
vim.api.nvim_set_keymap(v,   "<c-k>",     ":m '<-2<CR>gv=gv",                                             noremap)
vim.api.nvim_set_keymap(n,   "<c-j>",     ":m .+1<CR>==",                                                 noremap)
vim.api.nvim_set_keymap(i,   "<c-k>",     "<esc>:m .-2<CR>==i",                                           noremap)
vim.api.nvim_set_keymap(n,   "<c-k>",     ":m .-1<CR>==",                                                 noremap)
vim.api.nvim_set_keymap(i,   "<c-j>",     "<esc>:m .+1<CR>==i",                                           noremap)

-- Add space bellow or above without leaving normal mode
vim.api.nvim_set_keymap(n,  "[<space>",  ":<c-u>put!=repeat([''],v:count)<bar>']+1<cr>",                 noremapSilent)
vim.api.nvim_set_keymap(n,  "]<space>",  ":<c-u>put =repeat([''],v:count)<bar>'[-1<cr>",                 noremapSilent)

-- Use simple ; instead of shift + :
vim.api.nvim_set_keymap(n,   ";",         ":",                                                            noremap)
vim.api.nvim_set_keymap(v,   ";",         ":",                                                            noremap)

-- Use this instead of touching Esc key
vim.api.nvim_set_keymap(i,   "kj",        "<Esc>",                                                        noremap)
vim.api.nvim_set_keymap(i,   "jk",        "<Esc>",                                                        noremap)

-- Better tabbing
vim.api.nvim_set_keymap(n,   "<",         "v<gv<esc>",                                                    noremap)
vim.api.nvim_set_keymap(n,   ">",         "v>gv<esc>",                                                    noremap)
vim.api.nvim_set_keymap(v,   "<",         "<gv",                                                          noremap)
vim.api.nvim_set_keymap(v,   ">",         ">gv",                                                          noremap)

vim.api.nvim_set_keymap(v,   "\"",        "<esc>`>a'<esc>`<i'<esc>",                                      noremap)
vim.api.nvim_set_keymap(v,   "`",         "<esc>`>a`<esc>`<i`<esc>",                                      noremap)

vim.api.nvim_set_keymap(v,   "(",         "<esc>`>a)<esc>`<i(<esc>",                                      noremap)
vim.api.nvim_set_keymap(v,   "'",         "<esc>`>a]<esc>`<i[<esc>",                                      noremap)
vim.api.nvim_set_keymap(v,  "<c-{>",     "<esc>`>a}<esc>`<i{<esc>",                                      noremap)

vim.api.nvim_set_keymap(v,   ")",         "<esc>`>a)<esc>`<i(<esc>",                                      noremap)
vim.api.nvim_set_keymap(v,   "]",         "<esc>`>a]<esc>`<i[<esc>",                                      noremap)
vim.api.nvim_set_keymap(v,  "<c-}>",     "<esc>`>a}<esc>`<i{<esc>",                                      noremap)

vim.api.nvim_set_keymap(n,  "<space>ne", ":set noexpandtab!<cr>",                                        noremap)
vim.api.nvim_set_keymap(n,  "<space>et", ":set expandtab!<cr>",                                          noremap)

vim.api.nvim_set_keymap(
	n, "<space>bt",
	[[:highlight Normal     ctermbg=NONE guibg=NONE | highlight LineNr     ctermbg=NONE guibg=NONE | highlight SignColumn ctermbg=NONE guibg=NONE]],
	noremap
)
