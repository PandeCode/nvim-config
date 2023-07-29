vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
-- vim.opt.listchars:append "tab: ->"

vim.g.indent_blankline_filetype_exclude = { "", "checkhealth", "dashboard", "help", "lspinfo", "man", "packer" }

require("indent_blankline").setup({
	show_current_context = true,
	show_current_context_start = true,
})
