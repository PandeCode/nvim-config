local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local ls_ex = require("luasnip.extras")
local l = ls_ex.lambda
local rep = ls_ex.rep
local p = ls_ex.partial
local m = ls_ex.match
local n = ls_ex.nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local types = require("luasnip.util.types")

local function copy(args)
	return args[1]
end

vim.cmd([[
" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]])

ls.setup({})

require("luasnip.loaders.from_vscode").load({ paths = "./snippets" })

ls.add_snippets("javascript", {
	s("fn", {
		-- Simple static text.
		t("//Parameters: "),
		-- function, first parameter is the function, second the Placeholders
		-- whose text it gets as input.
		f(copy, 2),
		t({ "", "function " }),
		-- Placeholder/Insert.
		i(1),
		t("("),
		-- Placeholder with initial text.
		i(2, "int foo"),
		-- Linebreak
		t({ ") {", "\t" }),
		-- Last Placeholder, exit Point of the snippet.
		i(0),
		t({ "", "}" }),
	}),
})

ls.add_snippets("lua", {
	s(
		"req",
		fmt('local {} = require("{}")', {
			i(1),
			rep(1),
		})
	),
})
