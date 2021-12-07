require("headlines").setup({
	markdown = {
		source_pattern_start = "^```",
		source_pattern_end = "^```$",
		dash_pattern = "^---+$",
		headline_pattern = "^#+",
		headline_signs = { "Headline" },
		codeblock_sign = "CodeBlock",
		dash_highlight = "Dash",
	},
	rmd = {
		source_pattern_start = "^```",
		source_pattern_end = "^```$",
		dash_pattern = "^---+$",
		headline_pattern = "^#+",
		headline_signs = { "Headline" },
		codeblock_sign = "CodeBlock",
		dash_highlight = "Dash",
	},
	vimwiki = {
		source_pattern_start = "^{{{%a+",
		source_pattern_end = "^}}}$",
		dash_pattern = "^---+$",
		headline_pattern = "^=+",
		headline_signs = { "Headline" },
		codeblock_sign = "CodeBlock",
		dash_highlight = "Dash",
	},
	org = {
		source_pattern_start = "#%+[bB][eE][gG][iI][nN]_[sS][rR][cC]",
		source_pattern_end = "#%+[eE][nN][dD]_[sS][rR][cC]",
		dash_pattern = "^-----+$",
		headline_pattern = "^%*+",
		headline_signs = { "Headline" },
		codeblock_sign = "CodeBlock",
		dash_highlight = "Dash",
	},
})

-- vim.cmd [[highlight Headline1 guibg=#1e2718]]
-- vim.cmd [[highlight Headline2 guibg=#21262d]]
-- vim.cmd [[highlight CodeBlock guibg=#1c1c1c]]
-- vim.cmd [[highlight Dash guibg=#D19A66 gui=bold]]
-- vim.fn.sign_define("Headline1", { linehl = "Headline1" })
-- vim.fn.sign_define("Headline2", { linehl = "Headline2" })
--
-- require("headlines").setup {
--     org = {
--         headline_signs = { "Headline1", "Headline2" },
--     },
-- }
