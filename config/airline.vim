let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline_highlighting_cache = 1
let g:airline_extensions = ['branch', 'hunks', 'coc']

" Configure error/warning section to use coc.nvim
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
let g:airline_section_b = airline#section#create_left(['cmake'])
let g:airline_section_z = airline#section#create(['%3p%%: ', 'linenr', ':%3v'])
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

call airline#parts#define('cmake', {'function': 'CMakeStat'})
call airline#parts#define('linenr', {'function': 'MyLineNumber', 'accents': 'bold'})
call airline#add_statusline_func('NearestMethodOrFunction')
call airline#add_statusline_func('WindowNumber')
call airline#add_inactive_statusline_func('WindowNumber')
call airline#add_inactive_statusline_func('Render_Only_File')
