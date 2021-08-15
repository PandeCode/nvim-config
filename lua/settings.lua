vim.cmd("source $HOME/.config/nvim/vimscript/settings.vim")

vim.o.autoindent = true
vim.o.backspace = "indent,eol,start"
vim.o.clipboard = "unnamed"
vim.o.cmdheight = 2
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
vim.o.backup = false
vim.o.expandtab = false
vim.o.writebackup = false
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
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.timeoutlen = 1000
vim.o.ttyfast = true
vim.o.updatetime = 250
vim.o.visualbell = true
vim.o.winblend = 20
vim.o.wrap = true

--" Nice menu when typing `:find *.py`
vim.o.wildmode = "longest,list,full"
vim.o.wildmenu = true
--" Ignore files

vim.o.wildignore =
    "*.pyc" ..
    "*_build/*" ..
        "**/coverage/*" ..
            "**/Debug/*" .. "**/build/*" .. "**/node_modules/*" .. "**/android/*" .. "**/ios/*" .. "**/.git/*"
