let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline_highlighting_cache = 1
let g:airline_extensions = ['branch', 'hunks', 'coc']

" Configure error/warning section to use coc.nvim
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

function! AirlineInit()
		let g:airline_section_z = airline#section#create(['%{ObsessionStatus(''$'', '''')}', 'windowswap', '%3p%% ', 'linenr', ':%3v '])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

function! CMakeStat()
		let l:cmake_build_dir = get(g:, 'cmake_build_dir', 'Debug')
		let l:build_dir = finddir(l:cmake_build_dir, '.;')

		let l:retstr = ""
		if l:build_dir != ""
				if filereadable(build_dir . '/CMakeCache.txt')
						let cmcache = readfile(build_dir . '/CMakeCache.txt')
						for line in cmcache
								if line =~ "CMAKE_BUILD_TYPE"
										let value = reverse(split(line, '='))[0]
										let retstr = retstr . value . " "
								elseif line =~ "RUN_TESTS"
										let value = reverse(split(line, '='))[0]
										let retstr = retstr . "T" . value . " "
								endif
						endfor
				endif
		endif
		return substitute(retstr, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

call airline#parts#define('cmake', {'function': 'CMakeStat'})
let g:airline_section_b = airline#section#create_left(['cmake'])

function! MyLineNumber()
		return substitute(line('.'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g'). ' | '.
								\    substitute(line('$'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g')
endfunction

call airline#parts#define('linenr', {'function': 'MyLineNumber', 'accents': 'bold'})

let g:airline_section_z = airline#section#create(['%3p%%: ', 'linenr', ':%3v'])

function! WindowNumber(...)
		let builder = a:1
		let context = a:2
		call builder.add_section('airline_b', '%{tabpagewinnr(tabpagenr())}')
		return 0
endfunction

call airline#add_statusline_func('WindowNumber')
call airline#add_inactive_statusline_func('WindowNumber')

function! Render_Only_File(...)
		let builder = a:1
		let context = a:2

		call builder.add_section('file', '!! %F')

		return 0   " the default: draw the rest of the statusline
		return -1  " do not modify the statusline
		return 1   " modify the statusline with the current contents of the builder
endfunction
call airline#add_inactive_statusline_func('Render_Only_File')
