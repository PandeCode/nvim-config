set guifont=Fira\ Code\ Nerd\ Font

syntax sync minlines=256

set synmaxcol=128
set autoindent
set backspace=indent,eol,start
set clipboard=unnamed
set cmdheight=2
set confirm
set encoding=UTF-8
set gdefault
set hidden
set hlsearch
set ignorecase
set inccommand=nosplit
set incsearch
set lazyredraw
set linebreak
set list
set nobackup
set noexpandtab
set nowritebackup
set number
set pumblend=20
set ruler
set scrolloff=3
set shiftwidth=8
set shortmess+=c
set showcmd
set showmatch
set showtabline=2
set signcolumn=yes
set smartcase
set splitbelow
set t_Co=256
set t_ut=
set tabstop=4
set termguicolors
set timeoutlen=1000
set ttyfast
set updatetime=4000
set visualbell
set winblend=20
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

autocmd BufNewFile,BufRead *.* set noexpandtab
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.json set filetype=jsonc
