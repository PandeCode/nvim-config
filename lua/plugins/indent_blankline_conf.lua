vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "tab: ->"

require("indent_blankline").setup({
	show_current_context = true,
	show_current_context_start = true,
})
