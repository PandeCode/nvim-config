" Find files using Telescope command-line sugar.
nnoremap <space>ff <cmd>Telescope find_files<cr>
nnoremap <space>fg <cmd>Telescope live_grep<cr>
nnoremap <space>fb <cmd>Telescope buffers<cr>
nnoremap <space>fh <cmd>Telescope help_tags<cr>

noremap <space>tcm <cmd>Telescope coc mru<cr>
noremap <space>tcl <cmd>Telescope coc links<cr>
noremap <space>tcc <cmd>Telescope coc commands<cr>
noremap <space>tcr <cmd>Telescope coc references<cr>
noremap <space>tdef <cmd>Telescope coc definitions<cr>
noremap <space>tdec <cmd>Telescope coc declarations<cr>
noremap <space>tci <cmd>Telescope coc implementations<cr>
noremap <space>tct <cmd>Telescope coc type_definitions<cr>
noremap <space>tcd <cmd>Telescope coc diagnostics<cr>
noremap <space>tcc <cmd>Telescope coc code_actions<cr>
noremap <space>tcl <cmd>Telescope coc line_code_actions<cr>
noremap <space>tcf <cmd>Telescope coc file_code_actions<cr>
noremap <space>tcd <cmd>Telescope coc document_symbols<cr>
noremap <space>tcws <cmd>Telescope coc workspace_symbols<cr>
noremap <space>tcwd <cmd>Telescope coc workspace_diagnostics<cr>

lua << EOF
require('telescope').setup{
defaults = {
		vimgrep_arguments = {
				'rg',
				'--color=never',
				'--no-heading',
				'--with-filename',
				'--line-number',
				'--column',
				'--smart-case'
				},
		prompt_prefix = "> ",
		selection_caret = "> ",
entry_prefix = "  ",
initial_mode = "insert",
selection_strategy = "reset",
sorting_strategy = "descending",
layout_strategy = "horizontal",
layout_config = {
		horizontal = {
				mirror = false,
				},
		vertical = {
				mirror = false,
				},
		},
file_sorter =  require'telescope.sorters'.get_fuzzy_file,
file_ignore_patterns = {},
generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
shorten_path = true,
winblend = 0,
border = {},
borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
color_devicons = true,
use_less = true,
set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

-- Developer configurations: Not meant for general override
buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
}
}

require('telescope').load_extension('coc')
EOF
