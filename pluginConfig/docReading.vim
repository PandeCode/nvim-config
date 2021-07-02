if exists('g:did_load_filetypes')
		if executable('lesspipe.sh')
				let s:lesspipe_cmd = 'LESSQUIET=1 lesspipe.sh'
		elseif executable('lesspipe')
				let s:lesspipe_cmd = 'lesspipe'
		endif
		if exists('s:lesspipe_cmd') && executable('file')
				augroup lesspipe
						autocmd!
						autocmd BufReadPost *
												\ if  empty(&l:buftype) && !did_filetype() && !&l:binary && filereadable(bufname('%')) &&
												\     system('file --mime --brief ' . fnamemodify(resolve(expand('%')), ':p:S')) !~# '^text/' |
												\   silent exe '%!' . s:lesspipe_cmd . ' ' . expand('%:S') |
												\   setlocal filetype=text nomodifiable readonly |
												\ endif
				augroup END
		endif
endif

autocmd Filetype pdf
						\ exe '%!' . s:lesspipe_cmd . ' ' . expand('%:S') |
						\ setlocal filetype=text nomodifiable readonly |

" Remove extensions jar?|epub|doc[xm]|xls[xmb]|pp[st][xm] from g:zipPlugin_ext
" from Sep 13, 2016 and afterwards add back whenever converter unavailable
let g:zipPlugin_ext='*.apk,*.celzip,*.crtx,*.ear,*.gcsx,*.glox,*.gqsx,*.kmz,*.oxt,*.potm,*.potx,*.ppam,*.sldx,*.thmx,*.vdw,*.war,*.wsz,*.xap,*.xlam,*.xlam,*.xltm,*.xltx,*.xpi,*.zip'

let g:loaded_gzip = v:true
