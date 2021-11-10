require("compe").setup {
	enabled = true,
	autocomplete = true,
	debug = false,
	min_length = 1,
	preselect = "enable",
	throttle_time = 80,
	source_timeout = 200,
	incomplete_delay = 400,
	max_abbr_width = 100,
	max_kind_width = 100,
	max_menu_width = 100,
	documentation = true,
	source = {

		tags = true,
		spell = true,
		--omni = true,
		--treesitter= true,

		path = true,
		nvim_lsp = true,
		vsnip = true,
		buffer = true,
		calc = true,
		nvim_lua = true,
		tmux = {disabled = false, all_panes = false, kind = "Text"}
	}
}

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col(".") - 1
	if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
		return true
	else
		return false
	end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t "<C-n>"
	elseif check_back_space() then
		return t "<Tab>"
	else
		return vim.fn["compe#complete"]()
	end
end
_G.s_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t "<C-p>"
	else
		return t "<S-Tab>"
	end
end

vim.api.nvim_set_keymap(Keys.I,  "<Tab>",     "v:lua.tab_complete()",                                                Keys.Expr)
vim.api.nvim_set_keymap(Keys.S,  "<Tab>",     "v:lua.tab_complete()",                                                Keys.Expr)
vim.api.nvim_set_keymap(Keys.I,  "<S-Tab>",   "v:lua.s_tab_complete()",                                              Keys.Expr)
vim.api.nvim_set_keymap(Keys.S,  "<S-Tab>",   "v:lua.s_tab_complete()",                                              Keys.Expr)

--vim.api.nvim_set_keymap(Keys.I, "<cr>",      "compe#confirm(luaeval(\"require 'nvim-autopairs'.autopairs_cr()\"))", Keys.Expr)
vim.api.nvim_set_keymap(Keys.I, "<c-space>", "compe#complete()",                                                    Keys.Expr)
vim.api.nvim_set_keymap(Keys.I, "<C-j>",     "compe#scroll({ 'delta': +4 })",                                       Keys.Expr)
vim.api.nvim_set_keymap(Keys.I, "<C-k>",     "compe#scroll({ 'delta': -4 })",                                       Keys.Expr)

vim.cmd "source $HOME/.config/nvim/vimscript/config/compe.vim"
