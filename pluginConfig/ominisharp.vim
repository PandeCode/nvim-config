let g:OmniSharp_popup_position = 'peek'
if has('nvim')
		let g:OmniSharp_popup_options = {
								\ 'winhl': 'Normal:NormalFloat'
								\}
else
		let g:OmniSharp_popup_options = {
								\ 'highlight': 'Normal',
								\ 'padding': [0, 0, 0, 0],
								\ 'border': [1]
								\}
endif
let g:OmniSharp_popup_mappings = {
						\ 'sigNext': '<C-n>',
						\ 'sigPrev': '<C-p>',
						\ 'pageDown': ['<C-f>', '<PageDown>'],
						\ 'pageUp': ['<C-b>', '<PageUp>']
						\}

let g:OmniSharp_want_snippet = 1

let g:OmniSharp_highlight_groups = {
						\ 'ExcludedCode': 'NonText'
						\}
" }}}

" Sharpenup: {{{
" All sharpenup mappings will begin with `<Space>os`, e.g. `<Space>osgd` for
" :OmniSharpGotoDefinition
let g:sharpenup_map_prefix = '<Space>os'

let g:sharpenup_statusline_opts = { 'Text': '%s (%p/%P)' }
let g:sharpenup_statusline_opts.Highlight = 1

augroup OmniSharpIntegrations
		autocmd!
		autocmd User OmniSharpProjectUpdated,OmniSharpReady call lightline#update()
augroup END
" }}}

