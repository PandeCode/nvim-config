" AWK Embedding:
" ==============
" Shamelessly ripped from aspperl.vim by Aaron Hope.
if exists("b:current_syntax")
    unlet b:current_syntax
endif
syn include @AWKScript syntax/awk.vim
syn region AWKScriptCode matchgroup=AWKCommand start=+[=\\]\@<!'+ skip=+\\'+ end=+'+ contains=@AWKScript contained
syn cluster shCommandSubList add=AWKScriptEmbedded

syn region AWKScriptEmbedded matchgroup=AWKCommand start=+\<awk\>+ skip=+\\$+ end=+[=\\]\@<!'+me=e-1 contains=@shIdList,@shExprList2 nextgroup=AWKScriptCode

syn region AWKScriptEmbedded matchgroup=AWKCommand
    \ start=+\<g\?awk\>+ skip=+\\$+ end=+[=\\]\@<!'+me=e-1
    \ contains=@shIdList,@shExprList2 nextgroup=AWKScriptCode

syn region AWKScriptEmbedded matchgroup=AWKCommand
    \ start=+\$AWK\>+ skip=+\\$+ end=+[=\\]\@<!'+me=e-1
    \ contains=@shIdList,@shExprList2 containedin=shDerefSimple nextgroup=AWKScriptCode

hi def link AWKCommand Type
