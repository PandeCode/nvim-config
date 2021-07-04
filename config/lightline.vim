function! MyFiletype()
		return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
		return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

let g:lightline = {
						\ 'colorscheme': 'wombat',
						\ 'active': {
								\   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
								\ },
								\ 'tabline': {
										\   'left': [ ['buffers'] ],
										\   'right': [ ['close'] ]
										\ },
										\ 'component_expand': {
												\   'buffers': 'lightline#bufferline#buffers'
												\ },
												\ 'component_type': {
														\   'buffers': 'tabsel'
														\ },
														\ 'separator' : {
																\ 'left': '',
																\ 'right': '' 
																\ },
																\ 'subseparator' : {
																		\ 'left': '',
																		\ 'right': '' 
																		\ },
																		\ 'component_function': {
																				\   'filetype': 'MyFiletype',
																				\   'fileformat': 'MyFileformat',
																				\   'method': 'NearestMethodOrFunction'
																				\ },
																				\ }
" Use unicode chars for ale indicators in the statusline
let g:lightline#ale#indicator_checking = "\uf110 "
let g:lightline#ale#indicator_infos = "\uf129 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c "
" }}}

