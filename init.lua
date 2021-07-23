-- vim.eval([[
---- vim.api.nvim_eval([[
---- vim.api.nvim_exec([[
vim.cmd([[
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/commands.vim
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/bindings.vim

source $HOME/.config/nvim/lua/plugins/lightline.vim


set foldexpr=nvim_treesitter#foldexpr()
]])

require("utlis")

require ( "config/cppmake")
require ( "config/neovide")
require ( "plugins/barbar")
require ( "plugins/coc")
require ( "plugins/devicons")
require ( "plugins/docReading")
require ( "plugins/doge")
require ( "plugins/go")
require ( "plugins/neoformat")
require ( "plugins/search")
require ( "plugins/telescope")
require ( "plugins/theme")
require( "config/echoDoc" )
require( "config/godot" )
require( "config/markdown" )
require( "config/treesitter" )
require("config/rainbowIndex")


-- require ( "plugins/explorer")
--require ( "plugins/vista")
-- require ( "plugins/dashboard")
-- require ( "plugins/ominisharp")
-- require ( "plugins/vimspector")




