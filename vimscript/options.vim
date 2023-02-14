filetype plugin indent on

" Avoid E173 (n more file(s) to edit)
if argc() > 1
	silent blast " load last buffer
	silent bfirst " switch back to the first
endif

if exists('+termguicolors')
	let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

syntax sync minlines=256

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

com -nargs=1 -complete=command Mes
      \ :execute "tabnew | pu=execute(\'" . <q-args> . "\') | setl nomodified"	
