vim.g.python_recommended_style = 0
vim.g.python_host_skip_check=1
vim.g.loaded_python3_provider=1

vim.o.autoindent = true
vim.o.backspace = "indent,eol,start"
vim.o.backup = false
vim.o.clipboard = "unnamed"
vim.o.cmdheight = 1
vim.o.completeopt = "menu,menuone,noselect"
vim.o.confirm = true
vim.o.encoding = "UTF-8"
vim.o.gdefault = true
vim.o.guifont = "Fira Code Nerd Font"
vim.o.hidden = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.inccommand = "nosplit"
vim.o.incsearch = true
vim.o.lazyredraw = true
vim.o.linebreak = true
vim.o.list = true
vim.o.number = true
vim.o.pumblend = 20
vim.o.ruler = true
vim.o.scrolloff = 3
vim.o.shiftwidth = 8
vim.o.showcmd = true
vim.o.showmatch = true
vim.o.showtabline = 2
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.synmaxcol = 128
vim.o.termguicolors = true
vim.o.timeoutlen = 1000
--vim.o.ttimeoutlen = 0
vim.o.ttyfast = true
vim.o.undodir = "/home/shawn/.cache/nvim/undo"
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.visualbell = true
vim.o.winblend = 20
vim.o.wrap = true
vim.o.writebackup = false

--" Nice menu when typing `:find *.py`
vim.o.wildmode = "longest,list,full"
vim.o.wildmenu = true
--" Ignore files

vim.o.wildignore =
    "*.pyc" ..
    ",*_build/*" ..
        ",**/coverage/*" ..
            ",**/Debug/*" .. ",**/build/*" .. ",**/node_modules/*" .. ",**/android/*" .. ",**/ios/*" .. ",**/.git/*"

vim.cmd("source $HOME/.config/nvim/vimscript/settings.vim")
