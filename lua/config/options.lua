local options = {
	guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175",
	-- nformats = "alpha";
	conceallevel = 1,
	-- t_Co = 256;
	-- t_ut = true;
	-- shortmess = (shortmess .. "c");
	expandtab = false,
	ci = true,
	pi = true,
	-- sts = 0;
	shiftwidth = 4,
	tabstop = 4,
	autoindent = true,
	backspace = "indent,eol,start",
	backup = false,
	-- clipboard = "unnamed";
	cmdheight = 1,
	completeopt = "menu,menuone,noselect",
	confirm = true,
	encoding = "UTF-8",
	gdefault = true,
	guifont = "FantasqueSansM Nerd Font,:h20",
	-- t.guifont = { "ComicShannsMono Nerd Font", ":h20" };
	-- t.guifont = { "Cascadia Code", ":h20" };
	hidden = true,
	hlsearch = true,
	ignorecase = true,
	inccommand = "nosplit",
	incsearch = true,
	linebreak = true,
	list = true,
	number = true,
	pumblend = 20,
	ruler = true,
	scrolloff = 3,
	showcmd = true,
	showmatch = true,
	showtabline = 2,
	signcolumn = "yes",
	smartcase = true,
	splitbelow = true,
	synmaxcol = 128,
	termguicolors = true,
	timeout = true,
	timeoutlen = 1000,
	-- ttimeoutlen = 0;
	ttyfast = true,
	undodir = vim.fs.normalize "~/.cache/nvim/undodir",
	undofile = true,
	updatetime = 250,
	visualbell = true,
	winblend = 20,
	wrap = true,
	writebackup = false,
	-- " Nice menu when typing `:find *.py`;
	-- wildmode = "longest,list,full";
	-- wildmenu";
	-- " Ignore files;
	wildignore = "*.pyc,*_build/*,**/coverage/*,**/Debug/*,**/build/*,**/node_modules/*,**/android/*,**/ios/*,**/.git/*,*.lock",
}

for k, v in pairs(options) do
	vim.o[k] = v
end
