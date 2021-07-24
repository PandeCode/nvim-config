local utils = require("utils")

local cmd = vim.cmd
local indent = 4

cmd "syntax enable"
cmd "filetype plugin indent on"
utils.opt("b", "expandtab", false)
utils.opt("b", "shiftwidth", indent)
utils.opt("b", "smartindent", true)
utils.opt("b", "tabstop", indent)
utils.opt("o", "hidden", true)
utils.opt("o", "ignorecase", true)
utils.opt("o", "scrolloff", 4)
utils.opt("o", "shiftround", true)
utils.opt("o", "smartcase", true)
utils.opt("o", "splitbelow", true)
utils.opt("o", "splitright", true)
utils.opt("o", "wildmode", "list:longest")
utils.opt("w", "number", true)
utils.opt("w", "relativenumber", true)
utils.opt("o", "clipboard", "unnamed,unnamedplus")

-- Highlight on yank
vim.cmd "au TextYankPost * lua vim.highlight.on_yank {on_visual = false}"
vim.cmd(
    [[
syntax on
filetype plugin indent on

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
]]
)
