local notify = require("notify")

function CopilotInfo()
	notify(vim.api.nvim_exec("Copilot status", true), "info", {
		title = "Copilot",
	})
end

vim.g.copilot_filetypes = {
	["*"]  = false,
	bash   = true,
	cpp    = true,
	css    = true,
	html   = true,
	js     = true,
	jsx    = true,
	less   = true,
	lua    = true,
	org    = true,
	python = true,
	rust   = true,
	scss   = true,
	sh     = true,
	ts     = true,
	tsx    = true,
	txt    = true,
	yuck   = true,
	zsh    = true,
}

vim.g.copilot_no_tab_map = true

vim.api.nvim_set_keymap(Keys.I, "<C-c>",     'copilot#Accept("<CR>")',                     Keys.NoremapSilentExprScript)

vim.api.nvim_set_keymap(Keys.N, "<SPACE>ci", "<CMD>lua CopilotInfo()<CR>",                 Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N, "<SPACE>cd", "<CMD>lua vim.b.copilot_enabled = false<CR>", Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N, "<SPACE>ce", "<CMD>lua vim.b.copilot_enabled = true<CR>",  Keys.Noremap)

