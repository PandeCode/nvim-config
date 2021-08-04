function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! s:show_documentation()
		if (index(['vim','help'], &filetype) >= 0)
				execute 'h '.expand('<cword>')
		elseif (coc#rpc#ready())
				call CocActionAsync('doHover')
		else
				execute '!' . &keywordprg . " " . expand('<cword>')
		endif
endfunction

inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
						\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <CR>
						\ pumvisible() ? coc#_select_confirm() :
						\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
						\ <SID>check_back_space() ? "\<TAB>" :
						\ coc#refresh()

inoremap <silent><expr> <TAB>
						\ pumvisible() ? "\<C-n>" :
						\ <SID>check_back_space() ? "\<TAB>" :
						\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use `[g` and `]g` to navigate diagnostics Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
set keywordprg=:call\ <SID>show_documentation()

" Highlight the symbol and its references when holding the cursor.
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
autocmd CursorHold * silent call CocActionAsync('highlight')
au CursorHold * sil call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

augroup mygroup
		autocmd!
		" Setup formatexpr specified filetype(s).
		autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
		" Update signature help on jump placeholder.
		autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

nnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"


" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> ma  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> me  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> mc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> mo  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> ms  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> mj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> mk  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> mp  :<C-u>CocListResume<CR>


autocmd VimEnter * nmap <leader>ca :CocAction<CR>
autocmd VimEnter * vmap <leader>ca :CocAction<CR>

autocmd VimEnter * nmap <leader>cd :CocDiagnostics<CR>

autocmd VimEnter * nmap <leader>cf :CocFix<CR>
autocmd VimEnter * vmap <leader>cf :CocFix<CR>

autocmd VimEnter * nmap <leader>cr :CocRestart<CR>

nmap <F2> :CocCommand document.renameCurrentWord<CR>i
imap <F2> <ESC>:CocCommand document.renameCurrentWord<CR>i

" use <c-space>for trigger completion
inoremap <silent><expr> <NUL> coc#refresh()
inoremap <silent><expr> <c-space> coc#refresh()
