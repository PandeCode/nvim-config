syntax on
set guifont=FuraCode\ Nerd\ Font\ Mono

set termguicolors
if has("nvim")
		set winblend=20
		set pumblend=20
endif

set encoding=UTF-8
set tabstop=4
set autoindent
set shiftwidth=8
set scrolloff=3
set showcmd
set hidden
set wildmenu
set visualbell
set splitbelow
set ttyfast
set ruler
set backspace=indent,eol,start
set number
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set wrap
set linebreak
set nolist
set shortmess+=c
set t_Co=256
set t_ut=
set clipboard=unnamed
set showtabline=2
set list

filetype plugin indent on
"autocmd FileType python setlocal noexpandtab
autocmd FileType * setlocal noexpandtab
