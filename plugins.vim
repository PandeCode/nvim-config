" vim-plug auto setup
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
		if executable('curl')
				let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
				call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
				if v:shell_error
						echom "Error downloading vim-plug. Please install it manually.\n"
						exit
				endif
		else
				echom "vim-plug not installed. Please install it manually or install curl.\n"
				exit
		endif
endif


call plug#begin('~/.local/share/nvim/plugged')
" Semantic Highlight
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'folke/which-key.nvim'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

"Theme
Plug 'kaicataldo/material.vim'

" Ease motion
Plug 'andymass/vim-matchup'
Plug 'liuchengxu/vim-which-key'
Plug 'easymotion/vim-easymotion'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

" Language defaults
Plug 'sheerun/vim-polyglot'

" Syntax highlighting and Completion
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}

Plug 'liuchengxu/vista.vim'
Plug 'Shougo/echodoc.vim'

" File Explorer and Icons
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'

" Bar
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

"Session Manager
Plug 'tpope/vim-obsession'
Plug 'ludovicchabant/vim-gutentags'

" Start Page and Status Bar
Plug 'mhinz/vim-startify'
" Plug 'itchyny/lightline.vim'
" Plug 'mengelbrecht/lightline-bufferline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Better search
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Flutter
Plug 'dart-lang/dart-vim-plugin'

" Golang
Plug 'fatih/vim-go'

" Rustlang
Plug 'rust-lang/rust.vim'


Plug 'psf/black', { 'tag': '19.10b0' }

"Plug 'OmniSharp/omnisharp-vim'
"Plug 'nickspoons/vim-sharpenup'

" Vim FZF integration, used as OmniSharp selector
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Spotify
Plug 'HendrikPetertje/vimify'

Plug 'itchyny/vim-cursorword'
" Plug 'cosminadrianpopescu/vim-sql-workbench'

" Speed things up
Plug 'antoinemadec/FixCursorHold.nvim'

Plug 'voldikss/vim-floaterm'

Plug 'kana/vim-textobj-user'
Plug 'preservim/nerdcommenter'
Plug 'glts/vim-textobj-comment'

" Plug 'edkolev/tmuxline.vim'
Plug 'cdelledonne/vim-cmake'
Plug 'neoclide/jsonc.vim'

"Undo tree
Plug 'sjl/gundo.vim'

"Reading Documents
Plug 'Konfekt/vim-office'

" Making Documentation
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Debugging support
Plug 'puremourning/vimspector'

" Rainbow Brackets
Plug 'luochen1990/rainbow'

" Indent Guide
Plug 'Yggdroot/indentLine'


" Bazel Support
Plug 'google/vim-maktaba'
Plug 'google/vim-glaive'
Plug 'bazelbuild/vim-bazel'

" Code Formatting
Plug 'sbdchd/neoformat'

" Godot
Plug 'habamax/vim-godot'


" A simple, easy-to-use Vim alignment plugin.
Plug 'junegunn/vim-easy-align'

"Fix bad vim word movements eg: CamelCaseACRONYMWords_underscore1234
Plug 'chaoren/vim-wordmotion'

" Number toggle
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Sessions
Plug 'rmagatti/auto-session'

" Cheatsheet
Plug 'sudormrfbin/cheatsheet.nvim'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'fannheyward/telescope-coc.nvim'
Plug 'fhill2/telescope-ultisnips.nvim'
Plug 'nvim-telescope/telescope-node-modules.nvim'
Plug 'nvim-telescope/telescope-vimspector.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'nvim-telescope/telescope-github.nvim'
call plug#end()
