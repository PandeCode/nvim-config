vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
-- vim.opt.listchars:append "tab: ->"

require("ibl").setup({
	exclude = {
		filetypes = { "", "checkhealth", "dashboard", "help", "lspinfo", "man", "packer" },
	},
})
