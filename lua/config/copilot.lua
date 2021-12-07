CopilotOld = ""
CopilotUpdate = false

function GetCopilotInfo()
	if CopilotUpdate then
		CopilotUpdate = false
		CopilotOld = vim.api.nvim_exec("Copilot status", true)
	end

	return CopilotOld
end

vim.g.copilot_filetypes = {
	["*"] = false,
	python = true,
	lua = true,
	org = true,
	sh = true,
	bash = true,
	zsh = true,
	cpp = true,
	txt = true,
}

vim.g.copilot_no_tab_map = true

vim.api.nvim_set_keymap(Keys.I, "<C-c>", 'copilot#Accept("<CR>")', Keys.NoremapSilentExprScript)

vim.api.nvim_set_keymap(Keys.N, "<LEADER>ci", "lua CopilotUpdate         = true",  Keys.Noremap)
vim.api.nvim_set_keymap(Keys.N, "<LEADER>cd", "lua vim.b.copilot_enabled = false", Keys.Noremap)
