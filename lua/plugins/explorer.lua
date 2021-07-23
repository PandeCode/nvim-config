vim.api.nvim_command([[
let g:netrw_bufsettings = 'nohidden noma nomod nonu nowrap ro buflisted'
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

nnoremap <space>e :CocCommand explorer<CR>
nnoremap <space>er :call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR>

let g:coc_explorer_global_presets = {
						\   '.vim': {
								\     'root-uri': '~/.config/nvim',
								\   },
								\   'cocConfig': {
										\      'root-uri': '~/.config/nvim',
										\   },
										\   'tab': {
												\     'position': 'tab',
												\     'quit-on-open': v:true,
												\   },
												\   'tab:$': {
														\     'position': 'tab:$',
														\     'quit-on-open': v:true,
														\   },
														\   'floating': {
																\     'position': 'floating',
																\     'open-action-strategy': 'sourceWindow',
																\   },
																\   'floatingTop': {
																		\     'position': 'floating',
																		\     'floating-position': 'center-top',
																		\     'open-action-strategy': 'sourceWindow',
																		\   },
																		\   'floatingLeftside': {
																				\     'position': 'floating',
																				\     'floating-position': 'left-center',
																				\     'floating-width': 50,
																				\     'open-action-strategy': 'sourceWindow',
																				\   },
																				\   'floatingRightside': {
																						\     'position': 'floating',
																						\     'floating-position': 'right-center',
																						\     'floating-width': 50,
																						\     'open-action-strategy': 'sourceWindow',
																						\   },
																						\   'simplify': {
																								\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
																								\   },
																								\   'buffer': {
																										\     'sources': [{'name': 'buffer', 'expand': v:true}]
																										\   },
																										\ }

" Use preset argument to open it
nnoremap <space>ed :CocCommand explorer --preset .vim<CR>
nnoremap <space>ef :CocCommand explorer --preset floating<CR>
nnoremap <space>ec :CocCommand explorer --preset cocConfig<CR>
nnoremap <space>eb :CocCommand explorer --preset buffer<CR>

" List all presets
nnoremap <space>el :CocList explPresets<CR>

function! s:explorer_cur_dir()
		let node_info = CocAction('runCommand', 'explorer.getNodeInfo', 0)
		return fnamemodify(node_info['fullpath'], ':h')
endfunction

function! s:exec_cur_dir(cmd)
		let dir = s:explorer_cur_dir()
		execute 'cd ' . dir
		execute a:cmd
endfunction

function! s:init_explorer()
		set winblend=10

		" Integration with other plugins

		" CocList
		nnoremap <buffer> <Leader>fg :call <SID>exec_cur_dir('CocList -I grep')<CR>
		nnoremap <buffer> <Leader>fG :call <SID>exec_cur_dir('CocList -I grep -regex')<CR>
		nnoremap <buffer> <C-p> :call <SID>exec_cur_dir('CocList files')<CR>

		" vim-floaterm
		nnoremap <buffer> <Leader>ft :call <SID>exec_cur_dir('FloatermNew --wintype=floating')<CR>
endfunction

function! s:enter_explorer()
		if &filetype == 'coc-explorer'
				" statusline
				setl statusline=coc-explorer
		endif
endfunction

augroup CocExplorerCustom
		autocmd!
		autocmd BufEnter * call <SID>enter_explorer()
		autocmd FileType coc-explorer call <SID>init_explorer()
augroup END


"" CoC Explorer Settings
"augroup MyCocExplorer
  "autocmd!
  "autocmd VimEnter * sil! au! F
  "" set window status line
  "autocmd FileType coc-explorer setl statusline=File-Explorer
  ""quit explorer whein it's the last
  "autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
  "" Make sure nothing opened in coc-explorer buffer
  "autocmd BufEnter * if bufname('#') =~# "\[coc-explorer\]-." && winnr('$') > 1 | b# | endif
  "" open if directory specified or if buffer empty
  "autocmd VimEnter * let d = expand('%:p')
    "\ | if argc() == 0
      "\ | exe 'CocCommand explorer --quit-on-open --sources buffer+,file+'
    "\ | elseif isdirectory(d) || (bufname()=='')
      "\ | silent! bd
      "\ | exe 'CocCommand explorer --quit-on-open --sources buffer+,file+ ' . d
      "\ | exe 'cd ' . d
    "\ | else
      "\ | cd %:p:h
    "\ | endif
  "" cd after open
  "autocmd User CocExplorerOpenPost let dir = getcwd() | call CocActionAsync("runCommand", "explorer.doAction", "closest", {"name": "cd", "args": [dir]})
"augroup END

]])