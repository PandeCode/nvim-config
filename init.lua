require("packerConfig")

require("utils")
require("settings")
require("keybinds")
require("commands")

require("plugins/theme")

require("plugins/barbar")
require("plugins/coc")
require("plugins/cppmake")
require("plugins/dashboard")
require("plugins/devicons")
require("plugins/doge")
require("plugins/echoDoc")
require("plugins/godot")
require("plugins/lightline")
require("plugins/markdown")
require("plugins/neoformat")
require("plugins/neovide")
require("plugins/omnisharp")
require("plugins/rainbowIndex")
require("plugins/telescope")
require("plugins/treesitter")
require("plugins/vimspector")
require("plugins/vista")

require("plugins/docReading")

-- require("plugins/explorer")
-- require("plugins/go")

-- vim.eval([[
-- vim.api.nvim_eval([[
vim.cmd([[
source $HOME/.config/nvim/vimscript/plugins/search.vim
]])
