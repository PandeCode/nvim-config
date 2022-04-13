filetype indent on

set t_Co=256
set t_ut=
set shortmess+="c"
set noet ci pi sts=0 sw=4 ts=4

syntax sync minlines=256

autocmd BufNewFile,BufRead *.yuck set filetype=yuck
autocmd BufNewFile,BufRead *.keys set filetype=keys
autocmd BufNewFile,BufRead *.shader set filetype=glsl
autocmd BufNewFile,BufRead *.frag set filetype=glsl
autocmd BufNewFile,BufRead *.vert set filetype=glsl
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.json set filetype=jsonc
autocmd BufNewFile,BufRead *.h set filetype=c


" assumes set ignorecase smartcase;
augroup dynamic_smartcase
    autocmd!
    autocmd CmdLineEnter : set nosmartcase
    autocmd CmdLineLeave : set smartcase
augroup END


" Stop annoying you have one more file to edit
if argc()
	au VimEnter * args %
endif

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
