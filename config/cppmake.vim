"let g:cmake_link_compile_commands = 1
let g:lsp_cxx_hl_use_text_props = 1

nmap <leader>cg :CMakeGenerate<cr>
autocmd VimEnter * nmap <leader>cb :CMakeBuild<cr>
autocmd VimEnter * nmap <leader>cq :CMakeClose<cr>

if v:false 
		autocmd FileType cpp nn <silent><buffer> <C-l> :call CocLocations('ccls','$ccls/navigate',{'direction':'D'})<cr>
		autocmd FileType cpp nn <silent><buffer> <C-k> :call CocLocations('ccls','$ccls/navigate',{'direction':'L'})<cr>
		autocmd FileType cpp nn <silent><buffer> <C-j> :call CocLocations('ccls','$ccls/navigate',{'direction':'R'})<cr>
		autocmd FileType cpp nn <silent><buffer> <C-h> :call CocLocations('ccls','$ccls/navigate',{'direction':'U'})<cr>

		" bases
		autocmd FileType cpp nn <silent> xb :call CocLocations('ccls','$ccls/inheritance')<cr>
		" bases of up to 3 levels
		autocmd FileType cpp nn <silent> xB :call CocLocations('ccls','$ccls/inheritance',{'levels':3})<cr>
		" derived
		autocmd FileType cpp nn <silent> xd :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
		" derived of up to 3 levels
		autocmd FileType cpp nn <silent> xD :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>

		" caller
		autocmd FileType cpp nn <silent> xc :call CocLocations('ccls','$ccls/call')<cr>
		" callee
		autocmd FileType cpp nn <silent> xC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>

		" $ccls/member
		" member variables / variables in a namespace
		autocmd FileType cpp nn <silent> xm :call CocLocations('ccls','$ccls/member')<cr>
		" member functions / functions in a namespace
		autocmd FileType cpp nn <silent> xf :call CocLocations('ccls','$ccls/member',{'kind':3})<cr>
		" nested classes / types in a namespace
		autocmd FileType cpp nn <silent> xs :call CocLocations('ccls','$ccls/member',{'kind':2})<cr>

		autocmd FileType cpp nmap <silent> xt <Plug>(coc-type-definition)<cr>
		autocmd FileType cpp nn <silent> xv :call CocLocations('ccls','$ccls/vars')<cr>
		autocmd FileType cpp nn <silent> xV :call CocLocations('ccls','$ccls/vars',{'kind':1})<cr>

		autocmd FileType cpp nn xx x
endif
