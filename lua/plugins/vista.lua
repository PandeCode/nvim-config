vim.cmd([[
noremap <C-m> :Vista!!<CR> " Toggle side panel `CTRL+m`.

function! s:config_easyfuzzymotion(...) abort
		return extend(copy({
								\   'converters': [incsearch#config#fuzzyword#converter()],
								\   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
								\   'keymap': {"\<CR>": '<Over>(easymotion)'},
								\   'is_expr': 0,
								\   'is_stay': 1
								\ }), get(a:, 1, {}))
endfunction
]])
		
vim.g.vista_icon_indent = { "╰─▸ ", "├─▸ " }
vim.g.vista_fzf_preview = { 'right:50%' }
vim.g.vista_default_executive = 'coc'
vim.g.vista.renderer.enable_icon = 1

vim.g.vista.renderer.icons = {variable = ""}
vim.g.vista.renderer.icons ['function'] = ""
