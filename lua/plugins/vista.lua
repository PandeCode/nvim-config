vim.api.nvim_command([[
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

let g:vista_fzf_preview = ['right:50%']
let g:vista_default_executive = 'coc'
let g:vista#renderer#enable_icon = 1

let g:vista#renderer#icons = {
						\   "function": "\uf794",
						\   "variable": "\uf71b",
						\  }

function! s:config_easyfuzzymotion(...) abort
		return extend(copy({
								\   'converters': [incsearch#config#fuzzyword#converter()],
								\   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
								\   'keymap': {"\<CR>": '<Over>(easymotion)'},
								\   'is_expr': 0,
								\   'is_stay': 1
								\ }), get(a:, 1, {}))
endfunction

noremap <C-m> :Vista!!<CR> " Toggle side panel `CTRL+m`.

]])