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

