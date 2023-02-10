filetype indent on

" Stop annoying you have one more file to edit
if argc()
	lua pcall(vim.cmd, [[au VimEnter * args %]])
endif

if exists('+termguicolors')
	let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

syntax sync minlines=256

function! GFM()
	let langs = ['lua', 'json', 'js', 'ts','jsx', 'tsx', 'yaml', 'vim', 'c', 'cpp']

	for lang in langs
		unlet b:current_syntax
		silent! exec printf("syntax include @%s syntax/%s.vim", lang, lang)
		exec printf("syntax region %sSnip matchgroup=Snip start='```%s' end='```' contains=@%s",
					\ lang, lang, lang)
	endfor
	let b:current_syntax='mkd'

	syntax sync fromstart
endfunction

function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction

augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
