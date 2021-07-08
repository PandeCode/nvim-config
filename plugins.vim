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
Plug 'andymass/vim-matchup'

Plug 'sudormrfbin/cheatsheet.nvim'

Plug 'easymotion/vim-easymotion'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'Shougo/echodoc.vim'

Plug 'kana/vim-textobj-user'
Plug 'preservim/nerdcommenter'
Plug 'glts/vim-textobj-comment'

Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'glepnir/dashboard-nvim'
"Plug 'mhinz/vim-startify'
" Plug 'itchyny/lightline.vim'
" Plug 'mengelbrecht/lightline-bufferline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plug 'cosminadrianpopescu/vim-sql-workbench'

" Language defaults for syntax highlighting and other basic stuff
Plug 'sheerun/vim-polyglot'

" Syntax highlighting and Completion
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" Show file layout of functions and varibles and other symbols
Plug 'liuchengxu/vista.vim'

" Cool Tabline
Plug 'romgrk/barbar.nvim'

" Much needed tags file management making file searches exponentially faster
Plug 'ludovicchabant/vim-gutentags'

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

"Plug 'OmniSharp/omnisharp-vim'
"Plug 'nickspoons/vim-sharpenup'

" Spotify
Plug 'HendrikPetertje/vimify'

" Highlight current word under the cursor in the whole file
Plug 'itchyny/vim-cursorword'


" Speed things up
Plug 'antoinemadec/FixCursorHold.nvim'

" Get a floating terminal
Plug 'voldikss/vim-floaterm'

" Plug 'edkolev/tmuxline.vim'
Plug 'cdelledonne/vim-cmake'

" Json with comments support
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

" Indent Guide if spaces are used
Plug 'Yggdroot/indentLine'

" Bazel Support
Plug 'google/vim-maktaba'
Plug 'google/vim-glaive'
Plug 'bazelbuild/vim-bazel'

" Code Formatting
Plug 'sbdchd/neoformat'

" Gdscript
Plug 'habamax/vim-godot'

" A simple, easy-to-use Vim alignment plugin.
Plug 'junegunn/vim-easy-align'

"Fix bad vim word movements eg: CamelCaseACRONYMWords_underscore1234
Plug 'chaoren/vim-wordmotion'

" Number toggle 
Plug 'jeffkreeftmeijer/vim-numbertoggle'

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

" Semantic Highlight
Plug 'jackguo380/vim-lsp-cxx-highlight'

" Show the shortcuts in a popup
Plug 'folke/which-key.nvim'

" Repeat commands that are not native to vim like vim surround
Plug 'tpope/vim-repeat'

" Make brackets and other surrounding stuff
Plug 'tpope/vim-surround'

" Theme
Plug 'kaicataldo/material.vim'

" Let <C-A> or in my case <C-I> play nice with dates 2000-08-29 :help speeddating
Plug 'tpope/vim-speeddating'
call plug#end()
