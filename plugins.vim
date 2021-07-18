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
Plug 'itchyny/lightline.vim'

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
Plug 'dart-lang/dart-vim-plugin', {'for': ['dart', 'flutter']}

" Golang
Plug 'fatih/vim-go', {'for': ['go', 'golang']}

" Rustlang
Plug 'rust-lang/rust.vim', {'for': ['rust', 'cargo']}

"Plug 'OmniSharp/omnisharp-vim'
"Plug 'nickspoons/vim-sharpenup'

" Highlight current word under the cursor in the whole file
Plug 'itchyny/vim-cursorword'

" Speed things up
Plug 'antoinemadec/FixCursorHold.nvim'

" Get a floating terminal
Plug 'voldikss/vim-floaterm'

" CMake Build System Support
Plug 'cdelledonne/vim-cmake', {'for': ['cpp', 'c', 'cmake']}

" Json with comments support
Plug 'neoclide/jsonc.vim', {'for': ['json', 'jsonc']}

"Undo tree
Plug 'sjl/gundo.vim'

"Reading Documents
Plug 'Konfekt/vim-office'

" Making Documentation
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } , 'for': ['cpp', 'c', 'java', 'python', 'javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'bash', 'ruby', 'php', 'rust', 'groovy']}

" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' , 'for': ['markdown', 'md'] }

" Debugging support
Plug 'puremourning/vimspector'

" Rainbow Brackets
Plug 'luochen1990/rainbow'

" Indent Guide if spaces are used
Plug 'Yggdroot/indentLine'

" Bazel Support
Plug 'google/vim-maktaba', {'for': ['bzl', 'bazel']}
Plug 'google/vim-glaive', {'for': ['bzl', 'bazel']}
Plug 'bazelbuild/vim-bazel', {'for': ['bzl', 'bazel']}

" Code Formatting
Plug 'sbdchd/neoformat'

" Gdscript
Plug 'habamax/vim-godot', {'for': ['gdscript']}

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
Plug 'jackguo380/vim-lsp-cxx-highlight', {'for': ['c', 'cpp']}

" Show the shortcuts in a popup
Plug 'folke/which-key.nvim'

" Repeat commands that are not native to vim like vim surround
Plug 'tpope/vim-repeat'

" Make brackets and other surrounding stuff
Plug 'tpope/vim-surround'

" Theme
Plug 'dracula/vim', { 'as': 'dracula' } 

" Let <C-A> or in my case <C-I> play nice with dates 2000-08-29 :help speeddating
Plug 'tpope/vim-speeddating'
call plug#end()
