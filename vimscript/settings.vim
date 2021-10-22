set t_Co=256
set t_ut=

set shortmess+="c"

syntax sync minlines=256
filetype indent off

autocmd BufNewFile,BufRead *.keys set filetype=keys

autocmd BufNewFile,BufRead *.frag set filetype=glsl
autocmd BufNewFile,BufRead *.vert set filetype=glsl

autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.json set filetype=jsonc
autocmd BufNewFile,BufRead *.h set filetype=c

set noexpandtab!
set softtabstop=4
set tabstop=4

autocmd FileType * setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType * set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead,BufAdd,BufCreate,BufFilePre,BufReadPre,BufWrite,BufWritePre * setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead,BufAdd,BufCreate,BufFilePre,BufReadPre,BufWrite,BufWritePre * set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

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

