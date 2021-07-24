require("packerConfig")

require("utils")
require("settings")
require("keybinds")
require("commands")

require("plugins/barbar")
require("plugins/coc")
require("plugins/cppmake")
require("plugins/dashboard")
require("plugins/devicons")
require("plugins/doge")
require("plugins/echoDoc")
require("plugins/godot")
require("plugins/markdown")
require("plugins/neoformat")
require("plugins/neovide")
require("plugins/rainbowIndex")
require("plugins/theme")
require("plugins/treesitter")
require("plugins/vista")
require("plugins/lightline")

--require("plugins/explorer")
-- require("plugins/docReading")
-- require("plugins/ominisharp")
-- require("plugins/vimspector")
-- require("plugins/go")
require("plugins/search")
-- require("plugins/telescope")

-- vim.eval([[
-- vim.api.nvim_eval([[
vim.cmd([[
set foldexpr=nvim_treesitter#foldexpr()
]])
