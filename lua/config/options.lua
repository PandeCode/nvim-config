local options = {
	-- Visual Settings
	visual = {
		number = true, -- Show line numbers
		relativenumber = true, -- Show relative line numbers (new)
		termguicolors = true, -- Enable 24-bit RGB color in the TUI
		cursorline = true, -- Highlight the current line (new)
		signcolumn = "yes", -- Always show the sign column
		colorcolumn = "80", -- Show column marker (new)
		list = true, -- Show invisible characters
		listchars = "tab:→ ,lead:·,trail:·,nbsp:␣", -- Improve invisible character display (new)
		pumblend = 20, -- Popup menu transparency
		winblend = 20, -- Floating window transparency
		showtabline = 2, -- Always show tabline
		showmatch = true, -- Briefly jump to matching bracket
		scrolloff = 8, -- Keep 8 lines above/below cursor when scrolling (increased)
		sidescrolloff = 8, -- Keep 8 columns left/right of cursor (new)
		laststatus = 3, -- Global statusline (new)
	},

	-- Editing Settings
	editing = {
		expandtab = true, -- Use spaces instead of tabs (changed from false)
		shiftwidth = 4, -- Number of spaces for each indentation
		tabstop = 4, -- Number of spaces a <Tab> counts for
		softtabstop = 4, -- Number of spaces a <Tab> counts for in edit operations (new)
		smartindent = true, -- Smart indenting when starting a new line (new)
		autoindent = true, -- Copy indent from current line when starting a new line
		smarttab = true, -- Makes tabbing smarter (new)
		wrap = true, -- Wrap lines
		linebreak = true, -- Break lines at word boundaries
		formatoptions = "jcroqlnt", -- Configure format options (new)
		conceallevel = 1, -- Show concealed text partially
		virtualedit = "block", -- Allow cursor beyond end of line in visual block mode (new)
		completeopt = "menu,menuone,noselect", -- Better completion experience
	},

	-- Search Settings
	search = {
		hlsearch = true, -- Highlight all matches
		incsearch = true, -- Show matches as you type
		ignorecase = true, -- Ignore case in searches
		smartcase = true, -- Don't ignore case if pattern contains uppercase
		inccommand = "nosplit", -- Live substitution preview
		gdefault = true, -- Replace all matches on a line by default
	},

	-- File Handling
	files = {
		backup = false, -- Don't create backup files
		writebackup = false, -- Don't create a backup before overwriting
		swapfile = false, -- Don't create swap files (new)
		undofile = true, -- Persistent undo history
		undodir = vim.fs.normalize "~/.cache/nvim/undodir", -- Undo directory
		hidden = true, -- Allow switching buffers without saving
		confirm = true, -- Confirm before closing unsaved buffers
		autoread = true, -- Automatically read file when changed outside of Vim (new)
		fileencoding = "utf-8", -- Default file encoding (new)
		encoding = "UTF-8", -- Terminal encoding
	},

	-- Interface Settings
	interface = {
		mouse = "a", -- Enable mouse in all modes (new)
		updatetime = 100, -- Faster completion and fewer disk writes (reduced from 250)
		timeoutlen = 500, -- Time to wait for mapped sequence to complete (reduced from 1000)
		ttimeoutlen = 10, -- Time to wait for key code sequence (new)
		history = 1000, -- Remember more commands/search history (new)
		cmdheight = 1, -- Height of command bar
		splitbelow = true, -- Horizontal splits go below
		splitright = true, -- Vertical splits go right (new)
		guifont = "FantasqueSansM Nerd Font:h14", -- Set GUI font (reduced size)
		guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175",
		visualbell = true, -- Use visual bell instead of beeping
		title = true, -- Set window title (new)
		shortmess = "filnxtToOFIc", -- Shorter messages (new)
	},

	-- Spell checking
	spelling = {
		spell = true, -- Enable spell checking
		spelllang = "en_us", -- Set spell language to US English
	},

	-- Performance settings
	performance = {
		synmaxcol = 240, -- Max column for syntax highlight (increased from 128)
		ttyfast = true, -- Faster terminal connection
		redrawtime = 1000, -- Time in ms for redrawing the display (new)
	},

	-- Miscellaneous
	misc = {
		wildignore = table.concat({
			"*.pyc",
			"*_build/*",
			"**/coverage/*",
			"**/Debug/*",
			"**/build/*",
			"**/node_modules/*",
			"**/android/*",
			"**/ios/*",
			"**/.git/*",
			"*.lock",
			"*.aux",
			"*.bbl",
			"*.bcf",
			"*.blg",
			"*.fdb_latexmk",
			"*.fls",
			"*.log",
			"*.pdf",
			"*.run.xml",
			"*.synctex.gz",
			"*.tex",
			"*.toc",
			"*.DS_Store",
			"*.class",
			"*.out",
		}, ","), -- Ignore these files (improved)
		wildmode = "longest:full,full", -- Command-line completion mode (new)
		wildmenu = true, -- Show command-line completion matches (new)
		backspace = "indent,eol,start", -- Make backspace work as expected
		-- clipboard = "unnamedplus", -- Use system clipboard (new)
		showmode = false, -- Don't show mode in command line (new)
		showcmd = true, -- Show partial command in the last line
		ruler = true, -- Show cursor position
	},
}

-- Apply all the options
for category, settings in pairs(options) do
	for option, value in pairs(settings) do
		vim.opt[option] = value
	end
end

-- Set global variables
vim.g.mapleader = " " -- Set leader key to space
vim.g.maplocalleader = "," -- Set local leader key
vim.g.loaded_netrw = 1 -- Disable netrw
vim.g.loaded_netrwPlugin = 1 -- Disable netrw plugin
-- vim.g.do_filetype_lua = 1 -- Use Lua filetype detection (new)
-- vim.g.did_load_filetypes = 0 -- Don't load the old filetype.vim (new)

-- Disable unused built-in plugins for faster startup
local disabled_built_ins = {
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end
