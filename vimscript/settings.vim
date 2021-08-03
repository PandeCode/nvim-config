if has("nvim")
		set winblend=20
		set pumblend=20
endif

set autoindent
set backspace=indent,eol,start
set clipboard=unnamed
set confirm
set encoding=UTF-8
set gdefault
set hidden
set hlsearch
set ignorecase
set incsearch
set linebreak
set list
set noexpandtab
set number
set ruler
set scrolloff=3
set shiftwidth=8
set shortmess+=c
set showcmd
set showmatch
set showtabline=2
set smartcase
set splitbelow
set t_Co=256
set t_ut=
set tabstop=4
set ttyfast
set timeoutlen=300
set updatetime=300
set visualbell
set wrap

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/Debug/*
set wildignore+=**/build/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

set guifont=Fira\ Code\ Nerd\ Font,EmojiOne
set termguicolors

" lazy drawing
set lazyredraw
set ttyfast

autocmd BufNewFile,BufRead *.* set noexpandtab
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.json set filetype=jsonc

autocmd BufNewFile,BufRead,VimEnter * set noexpandtab
autocmd BufNewFile,BufRead,VimEnter *.py set noexpandtab
