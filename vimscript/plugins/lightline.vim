function! s:lightline_coc_diagnostic(kind, sign) abort
  let info = get(b:, 'coc_diagnostic_info', 0)
  if empty(info) || get(info, a:kind, 0) == 0
    return ''
  endif
  try
    let s = g:coc_user_config['diagnostic'][a:sign . 'Sign']
  catch
    let s = ''
  endtry
  return printf('%s %d', s, info[a:kind])
endfunction

function! LightlineCocErrors() abort
  return s:lightline_coc_diagnostic('error', 'error')
endfunction

function! LightlineCocWarnings() abort
  return s:lightline_coc_diagnostic('warning', 'warning')
endfunction

function! LightlineCocInfos() abort
  return s:lightline_coc_diagnostic('information', 'info')
endfunction

function! LightlineCocHints() abort
  return s:lightline_coc_diagnostic('hints', 'hint')
endfunction
\ }

function! LightlineNearestMethodOrFunction(...) abort
		return get(b:, 'vista_nearest_method_or_function', '')
endfunction

function! LightlineCMakeStat()
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

function! LightlineLineNumber()
return 1
"		return substitute(line('.'), '\\d\\@<=\\(\\(\\d\\{3\\}\\)\\+\\)$', ',&', 'g'). ' | '.
"								\    substitute(line('$'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g')
endfunction

function! LightLineFileType()
		return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightlineFileFormat()
		return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineReadonly()
		return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
		let branch = FugitiveHead()
		return branch !=# '' ? ''.branch : ''
endfunction

function! LightlineFileName()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

function! Rand() 
		return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:]) 
endfunction

let leftSeps    = ['', '', '', '']
let leftSubSeps = ['', '', '', '']
let leftIndex = Rand() % len(leftSeps)
let leftSep= leftSeps[leftIndex]
let leftSubSep= leftSubSeps[leftIndex]

let rightSeps    =['', '', '', '']
let rightSubSeps =['', '', '', '']
let rightIndex = Rand() % len(rightSeps)
let rightSep= rightSeps[rightIndex]
let rightSubSep= rightSubSeps[rightIndex]


