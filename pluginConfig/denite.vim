call denite#custom#var('file/rec', 'command', ['rg', '--hidden', '--files', '--glob', '!.git'])
"
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--smart-case', '--follow', '--hidden', '--vimgrep', '--heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#map(
						\ 'insert',
						\ '<Down>',
						\ '<denite:move_to_next_line>',
						\ 'noremap'
						\)
call denite#custom#map(
						\ 'insert',
						\ '<Up>',
						\ '<denite:move_to_previous_line>',
						\ 'noremap'
						\)

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
						\ 'auto_resize': 1,
						\ 'direction': 'rightbelow',
						\ 'winminheight': '10',
						\ 'highlight_mode_insert': 'Visual',
						\ 'highlight_mode_normal': 'Visual',
						\ 'prompt_highlight': 'Function',
						\ 'highlight_matched_char': 'Function',
						\ 'highlight_matched_range': 'Normal'
						\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
		for l:fname in keys(a:opts)
				for l:dopt in keys(a:opts[l:fname])
						call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
				endfor
		endfor
endfunction

call s:profile(s:denite_options)


nmap _ :DeniteProjectDir -split=floating -winrow=1 file/rec grep:::!<CR>
