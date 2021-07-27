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

"function! LightlineCocStatusDiagnostic() abort
		"let info = get(b:, 'coc_diagnostic_info', {})
		"if empty(info) | return '' | endif
		"let msgs = []
		"if get(info, 'error', 0)
				"call add(msgs, 'E' . info['error'])
		"endif
		"if get(info, 'warning', 0)
				"call add(msgs, 'W' . info['warning'])
		"endif
		"return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
"endfunction

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
		return substitute(line('.'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g'). ' | '.
								\    substitute(line('$'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g')
endfunction

function! LightlineFileType()
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
"
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

let g:lightline = {
		\ 'enable': {
		\   'tabline': 0
		\ },
		\ 'separator': { 'left': leftSep, 'right': rightSep },
		\ 'subseparator': { 'left': leftSubSep, 'right': rightSubSep },
		\ 'active': {
				\   'left': [
						\  [ 'mode', 'paste' ],
						\  [ 'LightlineReadonly', 'LightlineFileName', 'modified' ],
						\  [ 'LightlineNearestMethodOrFunction', 'LightlineTreesitter' ],
					\ ],
				\  'right': [
						\ ['charvaluehex', 'lineinfo', 'LightlineLineNumber'],
						\ ['LightlineFileType', 'LightlineFileFormat'],
						\ ['LightlineCMakeStat', 'LightlineFugitive'], 
                        \ ['coc_error', 'coc_warning', 'coc_hint', 'coc_info', ],
					\ ],
		\ },
		\ 'component': {
				\ 'charvaluehex': '0x%B',
				\ 'lineinfo': '%3l:%-2v%<',
		  \ },
		\ 'component_function': {
				\ 'LightlineCMakeStat': 'LightlineCMakeStat',
				\ 'LightlineFileFormat': 'LightlineFileFormat',
				\ 'LightlineFileType': 'LightlineFileType',
				\ 'LightlineFileName': 'LightlineFileName',
				\ 'LightlineFugitive': 'LightlineFugitive',
				\ 'LightlineLineNumber': 'LightlineLineNumber',
				\ 'LightlineNearestMethodOrFunction': 'LightlineNearestMethodOrFunction',
				\ 'LightlineReadonly': 'LightlineReadonly',
				\ 'LightlineTreesitter': 'nvim_treesitter#statusline',
				\ },
		\ 'component_expand': {
				\ 'coc_error'        : 'LightlineCocErrors',
				\ 'coc_warning'      : 'LightlineCocWarnings',
				\ 'coc_info'         : 'LightlineCocInfos',
				\ 'coc_hint'         : 'LightlineCocHints',
				\ 'coc_fix'          : 'LightlineCocFixes',
		\ },
		\ 'component_type' : {
				\ 'coc_error'        : 'error',
				\ 'coc_warning'      : 'warning',
				\ 'coc_info'         : 'tabsel',
				\ 'coc_hint'         : 'middle',
				\ 'coc_fix'          : 'middle',
		\ }
\ }

"\ 'LightlineCocStatusDiagnostic': 'LightlineCocStatusDiagnostic',
