-- vim.eval([[
---- vim.api.nvim_eval([[
---- vim.api.nvim_exec([[
vim.cmd(
    [[
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/commands.vim
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/bindings.vim

source $HOME/.config/nvim/lua/plugins/lightline.vim


set foldexpr=nvim_treesitter#foldexpr()
]]
)

require("utils")

require("plugins/cppmake")
require("plugins/neovide")
require("plugins/barbar")
require("plugins/coc")
require("plugins/devicons")
require("plugins/doge")
require("plugins/neoformat")
require("plugins/telescope")
require("plugins/theme")
require("plugins/echoDoc")
require("plugins/godot")
require("plugins/markdown")
require("plugins/treesitter")
require("plugins/rainbowIndex")

require("plugins/vista")
require("plugins/dashboard")

-- require("plugins/explorer")
-- require("plugins/docReading")
-- require ( "plugins/ominisharp")
-- require ( "plugins/vimspector")
--require("plugins/go")
--require("plugins/search")
