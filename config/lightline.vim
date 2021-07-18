function! WindowNumber(...)
		let builder = a:1
		let context = a:2
		call builder.add_section('airline_b', '%{tabpagewinnr(tabpagenr())}')
		return 0
endfunction


function! NearestMethodOrFunction(...) abort
		return get(b:, 'vista_nearest_method_or_function', '')
endfunction


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

function! MyLineNumber()
		return substitute(line('.'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g'). ' | '.
								\    substitute(line('$'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g')
endfunction

function! MyFiletype()
		return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
		return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineReadonly()
		return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
		if exists('*fugitive#head')
				let branch = fugitive#head()
				return branch !=# '' ? ''.branch : ''
		endif
		return ''
endfunction


let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'helloworld' ] ]
      \ },
      \ 'component': {
      \   'helloworld': 'Hello, world!'
      \ },
      \ }
